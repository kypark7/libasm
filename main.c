
# include <stdio.h>
# include <fcntl.h>
# include <string.h>
# include <unistd.h>
# include <stdlib.h>

size_t		ft_strlen(const char *s);
char		*ft_strcpy(char *dst, const char *src);
int			ft_strcmp(const char *s1, const char *s2);
ssize_t		ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t		ft_read(int fildes, void *buf, size_t nbyte);
char		*ft_strdup(const char *s1);

void    print_start_title(char *title)
 {
     printf("\n\n");
     printf("<==============START==============>");
     printf("\nTesting: [%s]\n", title);
     
 }

void print_end_title()
{
    printf("\n");
    printf("<===============END===============>");
    printf("\n\n\n\n");
}

void call_ft_strdup(char *s1)
{
    char *str;
    char *nstr;
    print_start_title("FT_STRDUP");
    str = strdup(s1);
    nstr = ft_strdup(s1);
    printf("ORIGINAL: [%s]\n", str);
    printf("MY COPY : [%s]\n", nstr);
    free(str);
    free(nstr);
    print_end_title();
}

void call_ft_strcmp(char *s1, char *s2)
{
    print_start_title("FT_STRCMP");
    int x = strcmp(s1, s2);
    int z = ft_strcmp(s1, s2);

    int x2 = strcmp(s2, s1);
    int z2 = ft_strcmp(s2, s1);

    int x3 = strcmp(s1, s1);
    int z3 = ft_strcmp(s1, s1);

    printf("ORIGINAL 1: [%d]\n", x);
    printf("COPY     1: [%d]\n", z);

    printf("\n");

    printf("ORIGINAL 2: [%d]\n", x2);
    printf("COPY     2: [%d]\n", z2);

    printf("\n");

    printf("ORIGINAL 3: [%d]\n", x3);
    printf("COPY     3: [%d]\n", z3);

    printf("\n");
    
    printf("ORIGINAL 3: [%d]\n", x);
    printf("COPY     3: [%d]\n", z);
    
    printf("\n");
    
    print_end_title();
}

int        main(int argc, char **argv)
{
    char *s1 = "Hello, world!";
    char *s2 = "My nickname is Fgeorgan!";
    char *s3 = "It's libasm project!";
    
    int fd_read = open("test.txt", O_RDONLY);
    int fd_fail_read = open("test2.txt", O_RDONLY);
    char buffer[1024];
    
    print_start_title("FT_STRLEN");
    printf("ORIGINAL: [%d] | [%d] | [%d]\n", (int)strlen(s1), (int)strlen(s2), (int)strlen(s3));
    printf("MY COPY : [%d] | [%d] | [%d]\n", (int)ft_strlen(s1), (int)ft_strlen(s2), (int)ft_strlen(s3));
    print_end_title();

    print_start_title("FT_READ");
    printf("ORIGINAL: [%d] | [%d]\n", (int)read(fd_read, buffer, 100), (int)read(fd_fail_read, buffer, 100));

    close(fd_fail_read);
    close(fd_read);
    fd_read = open("test.txt", O_RDONLY);
    fd_fail_read = open("test2.txt", O_RDONLY);
    

    printf("MY COPY : [%d] | [%d]\n", (int)ft_read(fd_read, buffer, 100), (int)ft_read(fd_fail_read, buffer, 110));
    print_end_title();
    
    int fd_write = open("write.txt", O_WRONLY);
    int fd_fail_write = open("write2.txt", O_WRONLY);
    char w_buffer[1024] = "";
    
    print_start_title("FT_WRITE");
    printf("ORIGINAL: [%d] | [%d]\n", (int)write(fd_write, w_buffer, 100), (int)write(fd_fail_write, w_buffer, 100));
    
    close(fd_write);
    close(fd_fail_write);
    fd_read = open("write.txt", O_WRONLY);
    fd_fail_read = open("write2.txt", O_WRONLY);
    

    printf("MY COPY : [%d] | [%d]\n", (int)ft_write(fd_write, w_buffer, 100), (int)ft_write(fd_fail_write, w_buffer, 110));
    print_end_title();
    
    close(fd_read);
    close(fd_write);
    close(fd_fail_read);
    close(fd_fail_write);
    
    char s4[1024] = "It's string for ft_strcpy";
    char s5[1024] = "";
    char s6[1024] = "";
    
    print_start_title("FT_STRCPY");
    printf("ORIGINAL: [%s]\n", strcpy(s5, s4));
    printf("MY COPY : [%s]", ft_strcpy(s6, s4));
    
    print_end_title();
    
    
    call_ft_strdup(s1);
    call_ft_strdup(s2);
    call_ft_strdup(s2);
    
    char *strr = "Hello";
    char *nstrr = "hi";
    call_ft_strcmp(strr, nstrr);
    return (0);
}