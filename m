Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7341835B730
	for <lists.virtualization@lfdr.de>; Mon, 12 Apr 2021 00:20:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CED840393;
	Sun, 11 Apr 2021 22:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4pX6SsNO5u2d; Sun, 11 Apr 2021 22:20:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E9F840394;
	Sun, 11 Apr 2021 22:20:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00299C000A;
	Sun, 11 Apr 2021 22:20:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17E8AC000A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 22:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB43C403A5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 22:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_5SQ5Ir56Kx
 for <virtualization@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 22:20:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C21EF40180
 for <virtualization@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 22:20:11 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id c16so11644911oib.3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 15:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=22ns3w2Lp6/GzZClkyqcdBBT7zw6HUfbfqljax9H/Yg=;
 b=BjxRFW8m2K7Yaa4oLc8oJ+/GvUlMA7JHu8kqUiFiileDxWAjMS49/XOoTa7mv7e3OA
 GdbASZn00ElgD+YXENBc7GhibV0XHQZm15AFuxiSCTc2pSlvJfLB/DN44Y4bTn6tGGVM
 afcVN41RsZVwzKcj9hofvGIUVrtXOki89uXYFr+CRiojQS0fVG4a/3wSCvFwVFcXy453
 7gjkwT7asPrtgsDjNjZxTMOcqzBV2jZmoh/g0oIOc0KbEdUdynay9ckoM4QvpY1SD/9x
 05f375hxwrG0uYc9rYe2uxSWrd1a/+T/RUNsvX89vVG2Vk/UUpt7Of1BxTcYCclRAQR1
 aSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=22ns3w2Lp6/GzZClkyqcdBBT7zw6HUfbfqljax9H/Yg=;
 b=auSwWv3evu3ojxaOAFIh7UWVACOzFEpqtAf+f2Orz/4n3v/Fun2k2D935ZrMHGv7st
 mIGZBzh1uQgdoWXpX5lET3bMV9fRsCQRUBkmDjeQIfD9PqtTCVos6LW34T5cAyoJSoRb
 ELCiQumcgV38sPk/Tem5a3VLdDGeqc3syFQsAPt71uvnmLYu75O1J2LMiXVknYHMe+hg
 RByKM2QtJ9IYrD27fx6Ko6PNMdsBzw3hevj2H7AvvTfVHsp6BPeDy8hqQMo5RWznaU38
 C+prjReTgUQq7xwMe7Wg0O42n95iu9j9oz/sKsEm7nwVxsz4uOK1sOChV0oepE2XXmMv
 W/gA==
X-Gm-Message-State: AOAM532F7dK8vStibw1zyNjSOXbgVQWCd4W5kPRh/Avej8J1Je8nN+1Q
 ZWilNytXZHWl4m7+tU8RShCNJLCRNkM=
X-Google-Smtp-Source: ABdhPJz8sfyal/C6reF90xUhf+6LPls6O0TbCQB0Id9MxcT+HYKmLwKmDGMv6W0rLw21dUYow3UCVw==
X-Received: by 2002:aca:482:: with SMTP id 124mr7761387oie.130.1618179610455; 
 Sun, 11 Apr 2021 15:20:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w5sm1253992oos.43.2021.04.11.15.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Apr 2021 15:20:09 -0700 (PDT)
Subject: Re: [PATCH net] virtio_net: Do not pull payload in skb->head
To: Eric Dumazet <edumazet@google.com>
References: <20210402132602.3659282-1-eric.dumazet@gmail.com>
 <20210411134329.GA132317@roeck-us.net>
 <CANn89iJ+RjYPY11zUtvmMkOp1E2DKLuAk2q0LHUbcJpbcZVSjw@mail.gmail.com>
 <0f63dc52-ea72-16b6-7dcd-efb24de0c852@roeck-us.net>
 <CANn89iJa8KAnfWvUB8Jr8hsG5x_Amg90DbpoAHiuNZigv75MEA@mail.gmail.com>
 <c1d15bd0-8b62-f7c0-0f2e-1d527827f451@roeck-us.net>
 <CANn89iK-AO4MpWQzh_VkMjUgdcsP4ibaV4RhsDF9RHcuC+_=-g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <271df9a8-1fdd-b65e-92c3-e66e2d332644@roeck-us.net>
Date: Sun, 11 Apr 2021 15:20:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANn89iK-AO4MpWQzh_VkMjUgdcsP4ibaV4RhsDF9RHcuC+_=-g@mail.gmail.com>
Content-Language: en-US
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

On 4/11/21 2:43 PM, Eric Dumazet wrote:
> On Sun, Apr 11, 2021 at 11:32 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 4/11/21 2:23 PM, Eric Dumazet wrote:
>>> On Sun, Apr 11, 2021 at 10:37 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> On 4/11/21 8:06 AM, Eric Dumazet wrote:
>>>>> On Sun, Apr 11, 2021 at 3:43 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>>> This patch causes a virtio-net interface failure when booting sh4 images
>>>>>> in qemu. The test case is nothing special: Just try to get an IP address
>>>>>> using udhcpc. If it fails, udhcpc reports:
>>>>>>
>>>>>> udhcpc: started, v1.33.0
>>>>>> udhcpc: sending discover
>>>>>> FAIL
>>>>>>
>>>>>
>>>>> Can you investigate where the incoming packet is dropped ?
>>>>>
>>>>
>>>> Unless I am missing something, packets are not dropped. It looks more
>>>> like udhcpc gets bad indigestion in the receive path and exits immediately.
>>>> Plus, it doesn't happen all the time; sometimes it receives the discover
>>>> response and is able to obtain an IP address.
>>>>
>>>> Overall this is quite puzzling since udhcpc exits immediately when the problem
>>>> is seen, no matter which option I give it on the command line; it should not
>>>> really do that.
>>>
>>>
>>> Could you strace both cases and report differences you can spot ?
>>>
>>> strace -o STRACE -f -s 1000 udhcpc
>>>
>>
>> I'll give it a try. It will take a while; I'll need to add strace to my root
>> file systems first.
>>
>> As a quick hack, I added some debugging into the kernel; it looks like
>> the data part of the dhcp discover response may get lost with your patch
>> in place.
> 
> Data is not lost, the payload is whole contained in skb frags, which
> was expected from my patch.
> 
> Maybe this sh arch does something wrong in this case.
> 
> This could be checksuming...
> 
> Please check
> 
> nstat -n
> <run udhcpc>
> nstat
> 

Does that tell you anything ?

/ # nstat -n
/ # udhcpc -n -q
udhcpc: started, v1.33.0
udhcpc: sending discover
/ # nstat
#kernel
IpInReceives                    1                  0.0
IpInDelivers                    1                  0.0
UdpIgnoredMulti                 1                  0.0
IpExtInBcastPkts                1                  0.0
IpExtInOctets                   576                0.0
IpExtInBcastOctets              576                0.0
IpExtInNoECTPkts                1                  0.0

Also, one interesting detail is that the problem is not seen all the time,
even with your patch in place. Not sure if I mentioned that before. strace
output in the success case (same image, with patch in place) looks as follows.

130   write(2, "udhcpc: sending discover\n", 25) = 25
130   socket(AF_PACKET, SOCK_DGRAM, htons(ETH_P_IP)) = 6
130   bind(6, {sa_family=AF_PACKET, sll_protocol=htons(ETH_P_IP), sll_ifindex=if_nametoindex("eth0"), sll_hatype=ARPHRD_NETROM, sll_pkttype=PACKET_HOST, sll_halen=6, sll_addr=[0xff, 0xff, 0xff, 0xf
130   sendto(6, "E\0\1H\0\0\0\0@\21y\246\0\0\0\0\377\377\377\377\0D\0C\0014\227r\1\1\6\0\5\16\36P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0RT\0\0224V\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0
130   close(6)                          = 0
130   fcntl64(5, F_SETFD, FD_CLOEXEC)   = 0
130   clock_gettime64(CLOCK_MONOTONIC, {tv_sec=25, tv_nsec=202168729}) = 0
130   poll([{fd=3, events=POLLIN}, {fd=5, events=POLLIN}], 2, 3000) = 1 ([{fd=5, revents=POLLIN}])
130   read(3, 0x7bf47a73, 1)            = -1 EAGAIN (Resource temporarily unavailable)
130   recvmsg(5, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="E\20\2@\0\10\0\0@\21l\224\n\0\2\2\377\377\377\377\0C\0D\2,\230\23\2\1\6\0\5\16\36P\0\0\0\0\0\0\0\0\n\0\2\17\n\0\2\2\0\0\0\0RT\0\0
130   clock_gettime64(CLOCK_MONOTONIC, {tv_sec=25, tv_nsec=205504062}) = 0
130   fcntl64(5, F_SETFD, FD_CLOEXEC)   = 0
130   socket(AF_INET, SOCK_RAW, IPPROTO_RAW) = 6
130   ioctl(6, SIOCGIFINDEX, {ifr_name="eth0", }) = 0
130   ioctl(6, SIOCGIFHWADDR, {ifr_name="eth0", ifr_hwaddr={sa_family=ARPHRD_ETHER, sa_data=52:54:00:12:34:56}}) = 0
130   close(6)                          = 0
130   clock_gettime64(CLOCK_MONOTONIC, {tv_sec=25, tv_nsec=208676862}) = 0
130   write(2, "udhcpc: sending select for 10.0.2.15\n", 37) = 37
130   socket(AF_PACKET, SOCK_DGRAM, htons(ETH_P_IP)) = 6
130   bind(6, {sa_family=AF_PACKET, sll_protocol=htons(ETH_P_IP), sll_ifindex=if_nametoindex("eth0"), sll_hatype=ARPHRD_NETROM, sll_pkttype=PACKET_HOST, sll_halen=6, sll_addr=[0xff, 0xff, 0xff, 0xf
130   sendto(6, "E\0\1H\0\0\0\0@\21y\246\0\0\0\0\377\377\377\377\0D\0C\0014\25Y\1\1\6\0\5\16\36P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0RT\0\0224V\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
130   close(6)                          = 0
130   fcntl64(5, F_SETFD, FD_CLOEXEC)   = 0
130   clock_gettime64(CLOCK_MONOTONIC, {tv_sec=25, tv_nsec=213060729}) = 0
130   poll([{fd=3, events=POLLIN}, {fd=5, events=POLLIN}], 2, 3000) = 1 ([{fd=5, revents=POLLIN}])
130   read(3, 0x7bf47a73, 1)            = -1 EAGAIN (Resource temporarily unavailable)
130   recvmsg(5, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="E\20\2@\0\t\0\0@\21l\223\n\0\2\2\377\377\377\377\0C\0D\2,\225\23\2\1\6\0\5\16\36P\0\0\0\0\0\0\0\0\n\0\2\17\n\0\2\2\0\0\0\0RT\0\02
130   clock_gettime64(CLOCK_MONOTONIC, {tv_sec=25, tv_nsec=215453662}) = 0
130   write(2, "udhcpc: lease of 10.0.2.15 obtained, lease time 86400\n", 54) = 54

In that case, the output of nstat is as follows.

/ # nstat
#kernel
IpInReceives                    2                  0.0
IpInDelivers                    2                  0.0
UdpIgnoredMulti                 2                  0.0
IpExtInBcastPkts                2                  0.0
IpExtInOctets                   1152               0.0
IpExtInBcastOctets              1152               0.0
IpExtInNoECTPkts                2                  0.0

Guenter
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
