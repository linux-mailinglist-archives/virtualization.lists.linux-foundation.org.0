Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DE835BA18
	for <lists.virtualization@lfdr.de>; Mon, 12 Apr 2021 08:23:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 486E040112;
	Mon, 12 Apr 2021 06:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gw5vHd398zNp; Mon, 12 Apr 2021 06:23:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21857403BE;
	Mon, 12 Apr 2021 06:23:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAF9DC000A;
	Mon, 12 Apr 2021 06:23:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D1B8C000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 06:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1762403BD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 06:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgD-K3zowwhU
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 06:23:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08C5C40112
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 06:23:32 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 101-20020a9d0d6e0000b02902816815ff62so5946777oti.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 23:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=rU5a1EHljNpaA4fA18WEkyEAA1ZSX5XgzZHvgsAYno4=;
 b=qtpDsmYPZb1cQWyC9DnHPW8WqDHdvxJh7BQ04H19RZqmh9wPWSCzBN91AcFmT2FfFS
 5nyFhBhmxLOdsLNinkMe5Hqabn+KG+suE7RgtwPPse1QKt1mfLe3OifINZKIPUY5TzZ1
 vOTbaDjc6sQeq7TvehyT0eJZOhwUidfSujsZ1df0fdzgftKp9L19hnpaKjtotEiWsWda
 0SrC31E1udIMHBx58NvjYcB0240y5SMBurPReg3vLP9Beyr7ONd5fKN50NNshIW6T2Sh
 Men4N/HJt3/e4tL6ev6g0465BMqhlR3kPuH3Q/b8FK2li/6GWKh+n8GUmCUnBRPqa1ZZ
 PdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=rU5a1EHljNpaA4fA18WEkyEAA1ZSX5XgzZHvgsAYno4=;
 b=OWUts2N46j1lmn5c9yinSE3v9o/Eg3jZ9DmXxL+9WTeqFUJlcYx8Jxz7qfRXg4JOGh
 gn6MGTzTQXDQYfazkOsq6G6Gr10Z2q6dsD98NPONt5BIu+PBAYIHBxJTbqft4SusqL38
 IWwodUKe3bFHExgnU6cVDNzhHfEpuKjcINhr51CoTMHOrTTcq/soeMjjOC3c9f+RAaVH
 rQPGlDAtIL8k2gVc8OwAkcLcT+Mhrk7jykGgIHVJpmwwymdfM0NXbgrToV+5si/LwUvg
 NE5PK5XgtNc/LTj9z/3MuufFDM956gvfcrgKhDbU2LgKfykVYhIPEF4SAO6boNO61XS7
 6MyQ==
X-Gm-Message-State: AOAM530CfX3lonbnLPB5hCljEeV1wf7w7B2mRqPOxTkY1RhrHrobha93
 8hMYeprnqk7oYg0WNle3Trc=
X-Google-Smtp-Source: ABdhPJyR0C9lA1MOvA3ZuFHDPvfzVdGFvhW1CFG4SpR2S2i0tYi7knFBkgJIM3lWb0UsX0Ep7C687w==
X-Received: by 2002:a05:6830:2043:: with SMTP id
 f3mr22903628otp.63.1618208611801; 
 Sun, 11 Apr 2021 23:23:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id b202sm1310594oii.3.2021.04.11.23.23.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 11 Apr 2021 23:23:31 -0700 (PDT)
Date: Sun, 11 Apr 2021 23:23:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net] virtio_net: Do not pull payload in skb->head
Message-ID: <20210412062329.GA50510@roeck-us.net>
References: <20210402132602.3659282-1-eric.dumazet@gmail.com>
 <20210411134329.GA132317@roeck-us.net>
 <CANn89iJ+RjYPY11zUtvmMkOp1E2DKLuAk2q0LHUbcJpbcZVSjw@mail.gmail.com>
 <0f63dc52-ea72-16b6-7dcd-efb24de0c852@roeck-us.net>
 <CANn89iJa8KAnfWvUB8Jr8hsG5x_Amg90DbpoAHiuNZigv75MEA@mail.gmail.com>
 <c1d15bd0-8b62-f7c0-0f2e-1d527827f451@roeck-us.net>
 <CANn89iK-AO4MpWQzh_VkMjUgdcsP4ibaV4RhsDF9RHcuC+_=-g@mail.gmail.com>
 <ad232021-d30a-da25-c1d5-0bd79628b5e1@roeck-us.net>
 <CANn89iLZyvjE-wUxfJ1FtAqZdD3OroObBdR9-bXR=GGb1ZASOw@mail.gmail.com>
 <CANn89i+g2uiYNUCvXH4YKQqPeSw+Ad4n6_=r3DBZTdHS8hBkMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89i+g2uiYNUCvXH4YKQqPeSw+Ad4n6_=r3DBZTdHS8hBkMQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eric Dumazet <eric.dumazet@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev <netdev@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi Eric,

On Mon, Apr 12, 2021 at 07:53:43AM +0200, Eric Dumazet wrote:
> On Mon, Apr 12, 2021 at 7:48 AM Eric Dumazet <edumazet@google.com> wrote:
> >
> 
> > give a verdict.
> >
> > Please post the whole strace output.
> >
> > Thanks.
> 
> Also please add -tt option to strace so that we have an idea of time
> delays just in case.
> 

The exact command as executed is:

strace -tt -o /tmp/STRACE -f -s 1000 udhcpc -n -q

Log is below. This is the complete log: nothing was truncated, neither
at the beginning nor at the end. The log ends with sendto().

Hope this helps,

Guenter

---
148   00:01:14.802467 execve("/sbin/udhcpc", ["udhcpc", "-n", "-q"], 0x7bbbbe10 /* 11 vars */) = 0
148   00:01:14.804496 set_tid_address(0x295faf94) = 148
148   00:01:14.805081 brk(NULL)         = 0x4c0000
148   00:01:14.805495 brk(0x4c2000)     = 0x4c2000
148   00:01:14.805998 mmap2(0x4c0000, 4096, PROT_NONE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4c0000
148   00:01:14.806750 mprotect(0x295f8000, 4096, PROT_READ) = 0
148   00:01:14.807524 mprotect(0x4be000, 4096, PROT_READ) = 0
148   00:01:14.808169 getuid32()        = 0
148   00:01:14.808670 open("/dev/null", O_RDWR|O_LARGEFILE) = 3
148   00:01:14.809415 close(3)          = 0
148   00:01:14.809886 pipe([3, 0])      = 3
148   00:01:14.810373 fcntl64(3, F_SETFD, FD_CLOEXEC) = 0
148   00:01:14.810827 fcntl64(4, F_SETFD, FD_CLOEXEC) = 0
148   00:01:14.811274 fcntl64(3, F_GETFL) = 0 (flags O_RDONLY)
148   00:01:14.811703 fcntl64(3, F_SETFL, O_RDONLY|O_NONBLOCK|O_LARGEFILE) = 0
148   00:01:14.812156 fcntl64(4, F_GETFL) = 0x1 (flags O_WRONLY)
148   00:01:14.812602 fcntl64(4, F_SETFL, O_WRONLY|O_NONBLOCK|O_LARGEFILE) = 0
148   00:01:14.813088 rt_sigprocmask(SIG_UNBLOCK, [RT_1 RT_2], NULL, 8) = 0
148   00:01:14.813648 rt_sigaction(SIGUSR1, {sa_handler=0x4328b0, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x295b6a2a}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
148   00:01:14.814381 rt_sigaction(SIGUSR2, {sa_handler=0x4328b0, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x295b6a2a}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
148   00:01:14.815106 rt_sigaction(SIGTERM, {sa_handler=0x4328b0, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x295b6a2a}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
148   00:01:14.815910 socket(AF_INET, SOCK_RAW, IPPROTO_RAW) = 5
148   00:01:14.816484 ioctl(5, SIOCGIFINDEX, {ifr_name="eth0", }) = 0
148   00:01:14.817111 ioctl(5, SIOCGIFHWADDR, {ifr_name="eth0", ifr_hwaddr={sa_family=ARPHRD_ETHER, sa_data=52:54:00:12:34:56}}) = 0
148   00:01:14.818042 close(5)          = 0
148   00:01:14.818660 write(2, "udhcpc: started, v1.33.0\n", 25) = 25
148   00:01:14.819387 clock_gettime64(CLOCK_MONOTONIC, {tv_sec=74, tv_nsec=819590988}) = 0
148   00:01:14.820117 vfork( <unfinished ...>
149   00:01:14.820652 execve("/usr/share/udhcpc/default.script", ["/usr/share/udhcpc/default.script", "deconfig"], 0x295fbfb0 /* 12 vars */ <unfinished ...>
148   00:01:14.821800 <... vfork resumed>) = 149
148   00:01:14.822606 wait4(149,  <unfinished ...>
149   00:01:14.823007 <... execve resumed>) = 0
149   00:01:14.823559 set_tid_address(0x295faf94) = 149
149   00:01:14.824135 brk(NULL)         = 0x4c0000
149   00:01:14.824568 brk(0x4c2000)     = 0x4c2000
149   00:01:14.824983 mmap2(0x4c0000, 4096, PROT_NONE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4c0000
149   00:01:14.825728 mprotect(0x295f8000, 4096, PROT_READ) = 0
149   00:01:14.826526 mprotect(0x4be000, 4096, PROT_READ) = 0
149   00:01:14.827180 getuid32()        = 0
149   00:01:14.827748 getpid()          = 149
149   00:01:14.828221 mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x295ea000
149   00:01:14.828963 rt_sigprocmask(SIG_UNBLOCK, [RT_1 RT_2], NULL, 8) = 0
149   00:01:14.829549 rt_sigaction(SIGCHLD, {sa_handler=0x4379f4, sa_mask=~[RTMIN RT_1 RT_2], sa_flags=SA_RESTORER, sa_restorer=0x295b6a2a}, NULL, 8) = 0
149   00:01:14.830347 getppid()         = 148
149   00:01:14.830837 uname({sysname="Linux", nodename="buildroot", ...}) = 0
149   00:01:14.831484 statx(AT_FDCWD, "/tmp", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=STATX_ATTR_MOUNT_ROOT, stx_mode=S_IFDIR|S_ISVTX|0777, stx_size=140, ...}) = 0
149   00:01:14.832588 statx(AT_FDCWD, ".", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=STATX_ATTR_MOUNT_ROOT, stx_mode=S_IFDIR|S_ISVTX|0777, stx_size=140, ...}) = 0
149   00:01:14.833685 open("/usr/share/udhcpc/default.script", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
149   00:01:14.834370 fcntl64(3, F_SETFD, FD_CLOEXEC) = 0
149   00:01:14.834866 fcntl64(3, F_DUPFD_CLOEXEC, 10) = 10
149   00:01:14.835292 fcntl64(10, F_SETFD, FD_CLOEXEC) = 0
149   00:01:14.835741 close(3)          = 0
149   00:01:14.836188 rt_sigaction(SIGINT, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
149   00:01:14.836753 rt_sigaction(SIGINT, {sa_handler=0x4379f4, sa_mask=~[RTMIN RT_1 RT_2], sa_flags=SA_RESTORER, sa_restorer=0x295b6a2a}, NULL, 8) = 0
149   00:01:14.837374 rt_sigaction(SIGQUIT, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
149   00:01:14.837985 rt_sigaction(SIGQUIT, {sa_handler=SIG_IGN, sa_mask=~[RTMIN RT_1 RT_2], sa_flags=SA_RESTORER, sa_restorer=0x295b6a2a}, NULL, 8) = 0
149   00:01:14.838602 rt_sigaction(SIGTERM, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
149   00:01:14.839200 read(10, "#!/bin/sh\n\n# udhcpc script edited by Tim Riker <Tim@Rikers.org>\n\n[ -z \"$1\" ] && echo \"Error: should be called from udhcpc\" && exit 1\n\nRESOLV_CONF=\"/etc/resolv.conf\"\n[ -e $RESOLV_CONF ] || touch $RESOLV_CONF\n[ -n \"$broadcast\" ] && BROADCAST=\"broadcast $broadcast\"\n[ -n \"$subnet\" ] && NETMASK=\"netmask $subnet\"\n# Handle stateful DHCPv6 like DHCPv4\n[ -n \"$ipv6\" ] && ip=\"$ipv6/128\"\n\nif [ -z \"${IF_WAIT_DELAY}\" ]; then\n\tIF_WAIT_DELAY=10\nfi\n\nwait_for_ipv6_default_route() {\n\tprintf \"Waiting for IPv6 default route to appear\"\n\twhile [ $IF_WAIT_DELAY -gt 0 ]; do\n\t\tif ip -6 route list | grep -q default; then\n\t\t\tprintf \"\\n\"\n\t\t\treturn\n\t\tfi\n\t\tsleep 1\n\t\tprintf \".\"\n\t\t: $((IF_WAIT_DELAY -= 1))\n\tdone\n\tprintf \" timeout!\\n\"\n}\n\ncase \"$1\" in\n\tdeconfig)\n\t\t/sbin/ifconfig $interface up\n\t\t/sbin/ifconfig $interface 0.0.0.0\n\n\t\t# drop info from this interface\n\t\t# resolv.conf may be a sy
 mlink to /tmp/, so take care\n\t\tTMPFILE=$(mktemp)\n\t\tgrep -vE \"# $interface\\$\" $RESOLV_CONF > $TMPFILE\n\t\tcat $TMPFILE > $RESOLV_CONF\n\t\t"..., 1023) = 1023
149   00:01:14.840495 mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x295eb000
149   00:01:14.841488 statx(AT_FDCWD, "/etc/resolv.conf", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=0, stx_mode=S_IFREG|0644, stx_size=27, ...}) = 0
149   00:01:14.845240 read(10, "-x /usr/sbin/avahi-autoipd ]; then\n\t\t\t/usr/sbin/avahi-autoipd -c $interface && /usr/sbin/avahi-autoipd -k $interface\n\t\tfi\n\t\t;;\n\n\tleasefail|nak)\n\t\tif [ -x /usr/sbin/avahi-autoipd ]; then\n\t\t\t/usr/sbin/avahi-autoipd -c $interface || /usr/sbin/avahi-autoipd -wD $interface --no-chroot\n\t\tfi\n\t\t;;\n\n\trenew|bound)\n\t\tif [ -x /usr/sbin/avahi-autoipd ]; then\n\t\t\t/usr/sbin/avahi-autoipd -c $interface && /usr/sbin/avahi-autoipd -k $interface\n\t\tfi\n\t\t/sbin/ifconfig $interface $ip $BROADCAST $NETMASK\n\t\tif [ -n \"$ipv6\" ] ; then\n\t\t\twait_for_ipv6_default_route\n\t\tfi\n\n\t\t# RFC3442: If the DHCP server returns both a Classless\n\t\t# Static Routes option and a Router option, the DHCP\n\t\t# client MUST ignore the Router option.\n\t\tif [ -n \"$staticroutes\" ]; then\n\t\t\techo \"deleting routers\"\n\t\t\troute -n | while read dest gw mask flags metric ref use iface; do\n\t\t\t\t[ \"$iface\" != \"$interface\" -o \"$gw\" =
  \"0.0.0.0\" ] || \\\n\t\t\t\t\troute del -net \"$dest\" netmask \"$mask\" gw \"$gw\" dev \"$interface\"\n\t\t\tdone\n\n\t\t\t# format: dest1/mask gw1"..., 1023) = 1023
149   00:01:14.847204 mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x295ec000
149   00:01:14.848965 read(10, "set -- $staticroutes\n\t\t\twhile [ -n \"$1\" -a -n \"$2\" ]; do\n\t\t\t\troute add -net \"$1\" gw \"$2\" dev \"$interface\"\n\t\t\t\tshift 2\n\t\t\tdone\n\t\telif [ -n \"$router\" ] ; then\n\t\t\techo \"deleting routers\"\n\t\t\twhile route del default gw 0.0.0.0 dev $interface 2> /dev/null; do\n\t\t\t\t:\n\t\t\tdone\n\n\t\t\tfor i in $router ; do\n\t\t\t\troute add default gw $i dev $interface\n\t\t\tdone\n\t\tfi\n\n\t\t# drop info from this interface\n\t\t# resolv.conf may be a symlink to /tmp/, so take care\n\t\tTMPFILE=$(mktemp)\n\t\tgrep -vE \"# $interface\\$\" $RESOLV_CONF > $TMPFILE\n\t\tcat $TMPFILE > $RESOLV_CONF\n\t\trm -f $TMPFILE\n\n\t\t# prefer rfc3397 domain search list (option 119) if available\n\t\tif [ -n \"$search\" ]; then\n\t\t\tsearch_list=$search\n\t\telif [ -n \"$domain\" ]; then\n\t\t\tsearch_list=$domain\n\t\tfi\n\n\t\t[ -n \"$search_list\" ] &&\n\t\t\techo \"search $search_list # $interface\" >> $RESOLV_CONF\n\n\t\tfor i in $
 dns ; do\n\t\t\techo adding dns $i\n\t\t\techo \"nameserver $i # $interface\" >> $RESOLV_CONF\n\t\tdone\n\t\t;;\nesac\n\nHOOK_DIR=\"$0.d\"\nfor hook in \"${HOOK_DIR}/\"*; do\n    [ -f \"${hook"..., 1023) = 1023
149   00:01:14.850631 mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x295ed000
149   00:01:14.852772 rt_sigprocmask(SIG_BLOCK, ~[RTMIN RT_1 RT_2], [], 8) = 0
149   00:01:14.853427 rt_sigprocmask(SIG_BLOCK, ~[], ~[KILL STOP RTMIN RT_1 RT_2], 8) = 0
149   00:01:14.854067 fork()            = 150
149   00:01:14.854756 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
149   00:01:14.855340 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
149   00:01:14.855911 wait4(-1,  <unfinished ...>
150   00:01:14.856325 gettid()          = 150
150   00:01:14.856883 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
150   00:01:14.857476 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
150   00:01:14.858144 close(10)         = 0
150   00:01:14.858604 rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=~[RTMIN RT_1 RT_2], sa_flags=SA_RESTORER, sa_restorer=0x295b6a2a}, NULL, 8) = 0
150   00:01:14.859379 execve("/sbin/ifconfig", ["/sbin/ifconfig", "eth0", "up"], 0x295eda04 /* 12 vars */) = 0
150   00:01:14.862391 set_tid_address(0x295faf94) = 150
150   00:01:14.863655 brk(NULL)         = 0x4c0000
150   00:01:14.864532 brk(0x4c2000)     = 0x4c2000
150   00:01:14.865440 mmap2(0x4c0000, 4096, PROT_NONE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4c0000
150   00:01:14.867189 mprotect(0x295f8000, 4096, PROT_READ) = 0
150   00:01:14.869004 mprotect(0x4be000, 4096, PROT_READ) = 0
150   00:01:14.870087 getuid32()        = 0
150   00:01:14.870621 socket(AF_INET, SOCK_DGRAM, IPPROTO_IP) = 3
150   00:01:14.871171 ioctl(3, SIOCGIFFLAGS, {ifr_name="eth0", ifr_flags=IFF_UP|IFF_BROADCAST|IFF_RUNNING|IFF_MULTICAST}) = 0
150   00:01:14.871909 ioctl(3, SIOCSIFFLAGS, {ifr_name="eth0", ifr_flags=IFF_UP|IFF_BROADCAST|IFF_RUNNING|IFF_MULTICAST}) = 0
150   00:01:14.872659 exit_group(0)     = ?
150   00:01:14.873240 +++ exited with 0 +++
149   00:01:14.873549 <... wait4 resumed>[{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 150
149   00:01:14.874007 --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=150, si_uid=0, si_status=0, si_utime=0, si_stime=0} ---
149   00:01:14.874460 sigreturn()       = 150
149   00:01:14.874828 wait4(-1, 0x7b8b8964, WNOHANG, NULL) = -1 ECHILD (No child process)
149   00:01:14.875593 rt_sigprocmask(SIG_BLOCK, ~[RTMIN RT_1 RT_2], [], 8) = 0
149   00:01:14.876216 rt_sigprocmask(SIG_BLOCK, ~[], ~[KILL STOP RTMIN RT_1 RT_2], 8) = 0
149   00:01:14.876812 fork()            = 151
149   00:01:14.877442 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
149   00:01:14.878210 rt_sigprocmask(SIG_SETMASK, [],  <unfinished ...>
151   00:01:14.878585 gettid( <unfinished ...>
149   00:01:14.878827 <... rt_sigprocmask resumed>NULL, 8) = 0
151   00:01:14.879189 <... gettid resumed>) = 151
149   00:01:14.879636 wait4(-1,  <unfinished ...>
151   00:01:14.879908 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
151   00:01:14.880474 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
151   00:01:14.881077 close(10)         = 0
151   00:01:14.881578 rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=~[RTMIN RT_1 RT_2], sa_flags=SA_RESTORER, sa_restorer=0x295b6a2a}, NULL, 8) = 0
151   00:01:14.882387 execve("/sbin/ifconfig", ["/sbin/ifconfig", "eth0", "0.0.0.0"], 0x295eda04 /* 12 vars */) = 0
151   00:01:14.884044 set_tid_address(0x295faf94) = 151
151   00:01:14.884600 brk(NULL)         = 0x4c0000
151   00:01:14.884991 brk(0x4c2000)     = 0x4c2000
151   00:01:14.885424 mmap2(0x4c0000, 4096, PROT_NONE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4c0000
151   00:01:14.886221 mprotect(0x295f8000, 4096, PROT_READ) = 0
151   00:01:14.886999 mprotect(0x4be000, 4096, PROT_READ) = 0
151   00:01:14.887634 getuid32()        = 0
151   00:01:14.888176 socket(AF_INET, SOCK_DGRAM, IPPROTO_IP) = 3
151   00:01:14.888763 ioctl(3, SIOCSIFADDR, {ifr_name="eth0", ifr_addr={sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("0.0.0.0")}}) = 0
151   00:01:14.890126 ioctl(3, SIOCGIFFLAGS, {ifr_name="eth0", ifr_flags=IFF_UP|IFF_BROADCAST|IFF_RUNNING|IFF_MULTICAST}) = 0
151   00:01:14.890830 ioctl(3, SIOCSIFFLAGS, {ifr_name="eth0", ifr_flags=IFF_UP|IFF_BROADCAST|IFF_RUNNING|IFF_MULTICAST}) = 0
151   00:01:14.891587 exit_group(0)     = ?
151   00:01:14.892248 +++ exited with 0 +++
149   00:01:14.892437 <... wait4 resumed>[{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 151
149   00:01:14.892855 --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=151, si_uid=0, si_status=0, si_utime=0, si_stime=0} ---
149   00:01:14.893283 sigreturn()       = 151
149   00:01:14.893676 wait4(-1, 0x7b8b8964, WNOHANG, NULL) = -1 ECHILD (No child process)
149   00:01:14.894402 pipe([3, 0])      = 3
149   00:01:14.894941 rt_sigprocmask(SIG_BLOCK, ~[RTMIN RT_1 RT_2], [], 8) = 0
149   00:01:14.895579 rt_sigprocmask(SIG_BLOCK, ~[], ~[KILL STOP RTMIN RT_1 RT_2], 8) = 0
149   00:01:14.896185 fork()            = 152
149   00:01:14.896824 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
149   00:01:14.897379 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
149   00:01:14.898012 close(4)          = 0
149   00:01:14.898493 read(3,  <unfinished ...>
152   00:01:14.898909 gettid()          = 152
152   00:01:14.899453 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
152   00:01:14.900073 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
152   00:01:14.900694 close(10)         = 0
152   00:01:14.901215 rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=~[RTMIN RT_1 RT_2], sa_flags=SA_RESTORER, sa_restorer=0x295b6a2a}, NULL, 8) = 0
152   00:01:14.901947 close(3)          = 0
152   00:01:14.902386 dup2(4, 1)        = 1
152   00:01:14.902828 close(4)          = 0
152   00:01:14.903493 statx(AT_FDCWD, "/sbin/mktemp", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, 0x7b8b867c) = -1 ENOENT (No such file or directory)
152   00:01:14.904350 statx(AT_FDCWD, "/usr/sbin/mktemp", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, 0x7b8b867c) = -1 ENOENT (No such file or directory)
152   00:01:14.905219 statx(AT_FDCWD, "/bin/mktemp", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=0, stx_mode=S_IFREG|S_ISUID|0755, stx_size=719260, ...}) = 0
152   00:01:14.906411 execve("/bin/mktemp", ["mktemp"], 0x295ed9e4 /* 12 vars */) = 0
152   00:01:14.908077 set_tid_address(0x295faf94) = 152
152   00:01:14.908657 brk(NULL)         = 0x4c0000
152   00:01:14.909091 brk(0x4c2000)     = 0x4c2000
152   00:01:14.909509 mmap2(0x4c0000, 4096, PROT_NONE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4c0000
152   00:01:14.910324 mprotect(0x295f8000, 4096, PROT_READ) = 0
152   00:01:14.911111 mprotect(0x4be000, 4096, PROT_READ) = 0
152   00:01:14.911775 getuid32()        = 0
152   00:01:14.912527 clock_gettime64(CLOCK_REALTIME, {tv_sec=74, tv_nsec=912746788}) = 0
152   00:01:14.913100 open("/tmp/tmp.kJfCJh", O_RDWR|O_CREAT|O_EXCL|O_LARGEFILE, 0600) = 3
152   00:01:14.913909 ioctl(1, _IOC(_IOC_READ, 0x74, 0x68, 0x8), 0x7ba83d58) = -1 ENOTTY (Not a tty)
152   00:01:14.914501 writev(1, [{iov_base="/tmp/tmp.kJfCJh", iov_len=15}, {iov_base="\n", iov_len=1}], 2) = 16
149   00:01:14.915257 <... read resumed>"/tmp/tmp.kJfCJh\n", 128) = 16
152   00:01:14.915787 exit_group(0 <unfinished ...>
149   00:01:14.916074 read(3,  <unfinished ...>
152   00:01:14.916360 <... exit_group resumed>) = ?
152   00:01:14.916808 +++ exited with 0 +++
149   00:01:14.916995 <... read resumed>"", 128) = 0
149   00:01:14.917317 --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=152, si_uid=0, si_status=0, si_utime=0, si_stime=0} ---
149   00:01:14.917754 sigreturn()       = 0
149   00:01:14.918225 close(3)          = 0
149   00:01:14.918716 wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 152
149   00:01:14.919344 wait4(-1, 0x7b8b887c, WNOHANG, NULL) = -1 ECHILD (No child process)
149   00:01:14.920220 open("/tmp/tmp.kJfCJh", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0666) = 3
149   00:01:14.921007 fcntl64(1, F_DUPFD_CLOEXEC, 10) = 11
149   00:01:14.921455 fcntl64(11, F_SETFD, FD_CLOEXEC) = 0
149   00:01:14.921995 dup2(3, 1)        = 1
149   00:01:14.922436 close(3)          = 0
149   00:01:14.922910 statx(AT_FDCWD, "/sbin/grep", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, 0x7b8b8868) = -1 ENOENT (No such file or directory)
149   00:01:14.923774 statx(AT_FDCWD, "/usr/sbin/grep", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, 0x7b8b8868) = -1 ENOENT (No such file or directory)
149   00:01:14.924634 statx(AT_FDCWD, "/bin/grep", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=0, stx_mode=S_IFREG|S_ISUID|0755, stx_size=719260, ...}) = 0
149   00:01:14.925771 rt_sigprocmask(SIG_BLOCK, ~[RTMIN RT_1 RT_2], [], 8) = 0
149   00:01:14.926468 rt_sigprocmask(SIG_BLOCK, ~[], ~[KILL STOP RTMIN RT_1 RT_2], 8) = 0
149   00:01:14.927060 fork()            = 153
149   00:01:14.927718 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
149   00:01:14.928310 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
149   00:01:14.928897 wait4(-1,  <unfinished ...>
153   00:01:14.929332 gettid()          = 153
153   00:01:14.929944 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
153   00:01:14.930555 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
153   00:01:14.931195 close(10)         = 0
153   00:01:14.931657 rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=~[RTMIN RT_1 RT_2], sa_flags=SA_RESTORER, sa_restorer=0x295b6a2a}, NULL, 8) = 0
153   00:01:14.932491 execve("/bin/grep", ["grep", "-vE", "# eth0$", "/etc/resolv.conf"], 0x295eda3c /* 12 vars */) = 0
153   00:01:14.934241 set_tid_address(0x295faf94) = 153
153   00:01:14.934826 brk(NULL)         = 0x4c0000
153   00:01:14.935235 brk(0x4c2000)     = 0x4c2000
153   00:01:14.935675 mmap2(0x4c0000, 4096, PROT_NONE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4c0000
153   00:01:14.936442 mprotect(0x295f8000, 4096, PROT_READ) = 0
153   00:01:14.937215 mprotect(0x4be000, 4096, PROT_READ) = 0
153   00:01:14.937884 getuid32()        = 0
153   00:01:14.938548 open("/etc/resolv.conf", O_RDONLY|O_LARGEFILE) = 3
153   00:01:14.939278 mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x295ea000
153   00:01:14.939984 read(3, "nameserver 10.0.2.3 # eth0\n", 1024) = 27
153   00:01:14.940648 mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x295eb000
153   00:01:14.941526 munmap(0x295eb000, 8192) = 0
153   00:01:14.942271 read(3, "", 1024) = 0
153   00:01:14.942796 close(3)          = 0
153   00:01:14.943267 munmap(0x295ea000, 4096) = 0
153   00:01:14.943777 exit_group(1)     = ?
153   00:01:14.944421 +++ exited with 1 +++
149   00:01:14.944623 <... wait4 resumed>[{WIFEXITED(s) && WEXITSTATUS(s) == 1}], 0, NULL) = 153
149   00:01:14.945037 --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=153, si_uid=0, si_status=1, si_utime=0, si_stime=0} ---
149   00:01:14.945505 sigreturn()       = 153
149   00:01:14.945946 wait4(-1, 0x7b8b89bc, WNOHANG, NULL) = -1 ECHILD (No child process)
149   00:01:14.946566 dup2(11, 1)       = 1
149   00:01:14.947085 close(11)         = 0
149   00:01:14.947752 open("/etc/resolv.conf", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0666) = 3
149   00:01:14.948764 fcntl64(1, F_DUPFD_CLOEXEC, 10) = 11
149   00:01:14.949223 fcntl64(11, F_SETFD, FD_CLOEXEC) = 0
149   00:01:14.949681 dup2(3, 1)        = 1
149   00:01:14.950166 close(3)          = 0
149   00:01:14.950615 statx(AT_FDCWD, "/sbin/cat", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, 0x7b8b8894) = -1 ENOENT (No such file or directory)
149   00:01:14.951450 statx(AT_FDCWD, "/usr/sbin/cat", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, 0x7b8b8894) = -1 ENOENT (No such file or directory)
149   00:01:14.952318 statx(AT_FDCWD, "/bin/cat", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=0, stx_mode=S_IFREG|S_ISUID|0755, stx_size=719260, ...}) = 0
149   00:01:14.953416 rt_sigprocmask(SIG_BLOCK, ~[RTMIN RT_1 RT_2], [], 8) = 0
149   00:01:14.954072 rt_sigprocmask(SIG_BLOCK, ~[], ~[KILL STOP RTMIN RT_1 RT_2], 8) = 0
149   00:01:14.954710 fork()            = 154
149   00:01:14.955371 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
149   00:01:14.955915 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
149   00:01:14.956480 wait4(-1,  <unfinished ...>
154   00:01:14.956911 gettid()          = 154
154   00:01:14.957469 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
154   00:01:14.958107 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
154   00:01:14.958726 close(10)         = 0
154   00:01:14.959220 rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=~[RTMIN RT_1 RT_2], sa_flags=SA_RESTORER, sa_restorer=0x295b6a2a}, NULL, 8) = 0
154   00:01:14.960010 execve("/bin/cat", ["cat", "/tmp/tmp.kJfCJh"], 0x295eda0c /* 12 vars */) = 0
154   00:01:14.961650 set_tid_address(0x295faf94) = 154
154   00:01:14.962260 brk(NULL)         = 0x4c0000
154   00:01:14.962677 brk(0x4c2000)     = 0x4c2000
154   00:01:14.963093 mmap2(0x4c0000, 4096, PROT_NONE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4c0000
154   00:01:14.963855 mprotect(0x295f8000, 4096, PROT_READ) = 0
154   00:01:14.964649 mprotect(0x4be000, 4096, PROT_READ) = 0
154   00:01:14.965332 getuid32()        = 0
154   00:01:14.965963 open("/tmp/tmp.kJfCJh", O_RDONLY|O_LARGEFILE) = 3
154   00:01:14.966693 sendfile64(1, 3, NULL, 16777216) = 0
154   00:01:14.967225 close(3)          = 0
154   00:01:14.967771 exit_group(0)     = ?
154   00:01:14.968431 +++ exited with 0 +++
149   00:01:14.968637 <... wait4 resumed>[{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 154
149   00:01:14.969062 --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=154, si_uid=0, si_status=0, si_utime=0, si_stime=0} ---
149   00:01:14.969524 sigreturn()       = 154
149   00:01:14.970021 wait4(-1, 0x7b8b89e8, WNOHANG, NULL) = -1 ECHILD (No child process)
149   00:01:14.970630 dup2(11, 1)       = 1
149   00:01:14.971135 close(11)         = 0
149   00:01:14.971803 statx(AT_FDCWD, "/sbin/rm", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, 0x7b8b88c0) = -1 ENOENT (No such file or directory)
149   00:01:14.972693 statx(AT_FDCWD, "/usr/sbin/rm", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, 0x7b8b88c0) = -1 ENOENT (No such file or directory)
149   00:01:14.973506 statx(AT_FDCWD, "/bin/rm", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=0, stx_mode=S_IFREG|S_ISUID|0755, stx_size=719260, ...}) = 0
149   00:01:14.974668 rt_sigprocmask(SIG_BLOCK, ~[RTMIN RT_1 RT_2], [], 8) = 0
149   00:01:14.975332 rt_sigprocmask(SIG_BLOCK, ~[], ~[KILL STOP RTMIN RT_1 RT_2], 8) = 0
149   00:01:14.975936 fork()            = 155
149   00:01:14.976585 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
149   00:01:14.977166 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
149   00:01:14.977733 wait4(-1,  <unfinished ...>
155   00:01:14.978296 gettid()          = 155
155   00:01:14.978860 rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1 RT_2], NULL, 8) = 0
155   00:01:14.979466 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
155   00:01:14.980076 close(10)         = 0
155   00:01:14.980557 rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=~[RTMIN RT_1 RT_2], sa_flags=SA_RESTORER, sa_restorer=0x295b6a2a}, NULL, 8) = 0
155   00:01:14.981350 execve("/bin/rm", ["rm", "-f", "/tmp/tmp.kJfCJh"], 0x295eda04 /* 12 vars */) = 0
155   00:01:14.983082 set_tid_address(0x295faf94) = 155
155   00:01:14.983662 brk(NULL)         = 0x4c0000
155   00:01:14.984120 brk(0x4c2000)     = 0x4c2000
155   00:01:14.984536 mmap2(0x4c0000, 4096, PROT_NONE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4c0000
155   00:01:14.985336 mprotect(0x295f8000, 4096, PROT_READ) = 0
155   00:01:14.986187 mprotect(0x4be000, 4096, PROT_READ) = 0
155   00:01:14.986851 getuid32()        = 0
155   00:01:14.987464 statx(AT_FDCWD, "/tmp/tmp.kJfCJh", AT_STATX_SYNC_AS_STAT|AT_SYMLINK_NOFOLLOW, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=0, stx_mode=S_IFREG|0600, stx_size=0, ...}) = 0
155   00:01:14.988583 unlink("/tmp/tmp.kJfCJh") = 0
155   00:01:14.989318 exit_group(0)     = ?
155   00:01:14.989984 +++ exited with 0 +++
149   00:01:14.990176 <... wait4 resumed>[{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 155
149   00:01:14.990593 --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=155, si_uid=0, si_status=0, si_utime=0, si_stime=0} ---
149   00:01:14.991041 sigreturn()       = 155
149   00:01:14.991439 wait4(-1, 0x7b8b8a14, WNOHANG, NULL) = -1 ECHILD (No child process)
149   00:01:14.992291 statx(AT_FDCWD, "/usr/sbin/avahi-autoipd", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, 0x7b8b87c0) = -1 ENOENT (No such file or directory)
149   00:01:14.993194 munmap(0x295ed000, 4096) = 0
149   00:01:14.993755 munmap(0x295ec000, 4096) = 0
149   00:01:14.994865 read(10, " continue\n    \"${hook}\" \"${@}\"\ndone\n\nexit 0\n", 1023) = 44
149   00:01:14.995743 mmap2(NULL, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x295ec000
149   00:01:14.996482 open("/usr/share/udhcpc/default.script.d/", O_RDONLY|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
149   00:01:14.997188 fcntl64(3, F_SETFD, FD_CLOEXEC) = 0
149   00:01:14.997687 mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x295f0000
149   00:01:14.998402 getdents64(3, 0x295f0088 /* 2 entries */, 2048) = 48
149   00:01:14.999027 getdents64(3, 0x295f0088 /* 0 entries */, 2048) = 0
149   00:01:14.999576 close(3)          = 0
149   00:01:15.000076 munmap(0x295f0000, 8192) = 0
149   00:01:15.000603 munmap(0x295ec000, 16384) = 0
149   00:01:15.001370 statx(AT_FDCWD, "/usr/share/udhcpc/default.script.d/*", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, 0x7b8b87d0) = -1 ENOENT (No such file or directory)
149   00:01:15.002240 statx(AT_FDCWD, "/usr/share/udhcpc/default.script.d/*", AT_STATX_SYNC_AS_STAT, STATX_BASIC_STATS, 0x7b8b87bc) = -1 ENOENT (No such file or directory)
149   00:01:15.003345 exit_group(0)     = ?
149   00:01:15.003998 +++ exited with 0 +++
148   00:01:15.004204 <... wait4 resumed>[{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 149
148   00:01:15.004606 --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=149, si_uid=0, si_status=0, si_utime=0, si_stime=2} ---
148   00:01:15.005134 socket(AF_PACKET, SOCK_DGRAM, htons(ETH_P_IP)) = 5
148   00:01:15.005673 bind(5, {sa_family=AF_PACKET, sll_protocol=htons(ETH_P_IP), sll_ifindex=if_nametoindex("eth0"), sll_hatype=ARPHRD_NETROM, sll_pkttype=PACKET_HOST, sll_halen=0}, 20) = 0
148   00:01:15.006493 setsockopt(5, SOL_PACKET, PACKET_AUXDATA, [1], 4) = 0
148   00:01:15.007093 fcntl64(5, F_SETFD, FD_CLOEXEC) = 0
148   00:01:15.007594 socket(AF_INET, SOCK_RAW, IPPROTO_RAW) = 6
148   00:01:15.008067 ioctl(6, SIOCGIFINDEX, {ifr_name="eth0", }) = 0
148   00:01:15.008670 ioctl(6, SIOCGIFHWADDR, {ifr_name="eth0", ifr_hwaddr={sa_family=ARPHRD_ETHER, sa_data=52:54:00:12:34:56}}) = 0
148   00:01:15.009520 close(6)          = 0
148   00:01:15.010058 clock_gettime64(CLOCK_MONOTONIC, {tv_sec=75, tv_nsec=10264188}) = 0
148   00:01:15.010691 write(2, "udhcpc: sending discover\n", 25) = 25
148   00:01:15.011397 socket(AF_PACKET, SOCK_DGRAM, htons(ETH_P_IP)) = 6
148   00:01:15.011946 bind(6, {sa_family=AF_PACKET, sll_protocol=htons(ETH_P_IP), sll_ifindex=if_nametoindex("eth0"), sll_hatype=ARPHRD_NETROM, sll_pkttype=PACKET_HOST, sll_halen=6, sll_addr=[0xff, 0xff, 0xff, 0xff, 0xff, 0xff]}, 20) = 0
148   00:01:15.012830 sendto(6, "E\0\1H\0\0\0\0@\21y\246\0\0\0\0\377\377\377\377\0D\0C\0014!~\1\1\6\0\272\352\336g\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0RT\0\0224V\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0c\202Sc5\1\1=\7\1RT\0\0224V9\2\2@7\7\1\3\6\f\17\34*<\fudhcp 1.33.0\377\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 328, 0, {sa_family=AF_PACKET, sll_protocol=htons(ETH_P_IP), sll_ifindex=if_nametoindex("eth0"), sll_hatype=ARPHRD_NETROM, sll_pkttype=PACKET_HOST, sll_halen=6, sll_addr=[0xff, 0xff, 0xff, 0xff, 0xff, 0xff]}, 20
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
