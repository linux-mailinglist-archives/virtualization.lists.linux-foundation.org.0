Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3850CBD8
	for <lists.virtualization@lfdr.de>; Sat, 23 Apr 2022 17:35:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E0D6415E3;
	Sat, 23 Apr 2022 15:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvHALKynyJIc; Sat, 23 Apr 2022 15:35:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AC26E415CD;
	Sat, 23 Apr 2022 15:35:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BE05C002D;
	Sat, 23 Apr 2022 15:35:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9C68C002D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Apr 2022 15:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 989E5405D3
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Apr 2022 15:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=blackwall-org.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3NJ68o9Yl5Pi
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Apr 2022 15:35:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 470E9404A3
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Apr 2022 15:35:29 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id e30so10217311eda.0
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Apr 2022 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackwall-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=o/CJ5WWEETXK69oPoyBSWz7VeMGOtK+lSlLywL1D9Nk=;
 b=BE3VvQpPCKWlIFjbA3lVG7mn7VcetLMgpTQeJFc6keKzpdsTRzAdiruWx3JIgEoCdB
 COovHQS6riaiG6GDioqj2MVosUXmiVj/GfhxtDEn51EtX3HGSCd1Fu0mdPvJANsLhMc1
 NhSUikBjtpDdsA62BxR1jH+SZqACfkrVSk2yTgfEK72AHBHspklM3hHbC3o6upvGXpdu
 ZiB1Uh/pLD4/jH7wKdgElUN3kMDCtRXmPtys1UQSqOSmcF4ILo5Z5zauUHx3LrsoNmBP
 Up3XYD7er2+fkF3WwuKbPNhDh4Jov5a17GpbEkpj8qBpEoYuqGoIsUxERDX5NZBrNS15
 5y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=o/CJ5WWEETXK69oPoyBSWz7VeMGOtK+lSlLywL1D9Nk=;
 b=xXsmZMkL5f/gPzcg6iQeeLPoeaEq3QuGQxnnnf+rTjlvWFFxG8IQp4Gxk/yaDP6u2h
 t6rpdGsoaElc5j+5zt3fG6kbN5EKLhxfBcztE16j8SEMaAJt+MDL5hBKtrXCw7dzuWl4
 tk9/gibZhuoX/YbJOGUQI88mSXHl18qk8ZPmCvcxyaVccjXilaieiEddn1B7kCXITYOd
 1kEsfeEEDDaaouQkKFrYbsLnelLc90QdHgaJdsnqQCt6a+ht/5VHCDGk1t6X0tdSJuXr
 FRxWoe1IavLfXlaPf6rVxyyehs/fappHnaOet8D437Q3McqUkDGHJMqjQnkZudrWaA6h
 VOGA==
X-Gm-Message-State: AOAM532ZGNKO2z5FoBaf7XVprN30bWN5PTuDL3xbl1nfcSoiHVO27AOn
 sXqsfuh0NoYpzxZZyKJvP65pbA==
X-Google-Smtp-Source: ABdhPJxFI9jbc24y64+cuaiBnirbclKSmsPpxv/8DfB0P4w7IIklyDTTiU+OBAHP6TmH1ZYIuNgIJg==
X-Received: by 2002:aa7:dd87:0:b0:425:c104:71bf with SMTP id
 g7-20020aa7dd87000000b00425c10471bfmr8179979edv.110.1650728127336; 
 Sat, 23 Apr 2022 08:35:27 -0700 (PDT)
Received: from [192.168.0.111] (87-243-81-1.ip.btc-net.bg. [87.243.81.1])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170906520f00b006cd07ba40absm1763359ejm.160.2022.04.23.08.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:35:26 -0700 (PDT)
Message-ID: <c7e49737-c5f8-5164-88ad-599c828c5d23@blackwall.org>
Date: Sat, 23 Apr 2022 18:35:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH net] virtio_net: fix wrong buf address calculation when
 using xdp
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20220423112612.2292774-1-razor@blackwall.org>
 <1650720683.8168066-1-xuanzhuo@linux.alibaba.com>
 <8d511a16-8d69-82b1-48a1-24de3a592aef@blackwall.org>
 <a58bfd2c-4f83-11fe-08d1-19c1d6497fc2@blackwall.org>
 <1650724608.256497-2-xuanzhuo@linux.alibaba.com>
 <c206c147-ad7e-b615-2e96-572482335563@blackwall.org>
 <1650726113.2334588-1-xuanzhuo@linux.alibaba.com>
 <ff95db6e-5a0a-7e63-080f-c719ac434c34@blackwall.org>
In-Reply-To: <ff95db6e-5a0a-7e63-080f-c719ac434c34@blackwall.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kuba@kernel.org, davem@davemloft.net
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

On 23/04/2022 18:23, Nikolay Aleksandrov wrote:
> On 23/04/2022 18:01, Xuan Zhuo wrote:
>> On Sat, 23 Apr 2022 17:58:05 +0300, Nikolay Aleksandrov <razor@blackwall.org> wrote:
>>> On 23/04/2022 17:36, Xuan Zhuo wrote:
>>>> On Sat, 23 Apr 2022 17:30:11 +0300, Nikolay Aleksandrov <razor@blackwall.org> wrote:
>>>>> On 23/04/2022 17:16, Nikolay Aleksandrov wrote:
>>>>>> On 23/04/2022 16:31, Xuan Zhuo wrote:
>>>>>>> On Sat, 23 Apr 2022 14:26:12 +0300, Nikolay Aleksandrov <razor@blackwall.org> wrote:
[snip]
>>>>>>> +                                                      VIRTIO_XDP_HEADROOM - metazie);
>>>>>>>                                 return head_skb;
>>>>>>>                         }
>>>>>>>                         break;
>>>>>>
>>>>>> That patch doesn't fix it, as I said with xdp you can move both data and data_meta.
>>>>>> So just doing that would take care of the meta, but won't take care of moving data.
>>>>>>
>>>>>
>>>>> Also it doesn't take care of the case where page_to_skb() is called with the original page
>>>>> i.e. when we already have headroom, so we hit the next/standard page_to_skb() call (xdp_page == page).
>>>>
>>>> Yes, you are right.
>>>>
>>>>>
>>>>> The above change guarantees that buf and p will be in the same page
>>>>
>>>>
>>>> How can this be guaranteed?
>>>>
>>>> 1. For example, we applied for a 32k buffer first, and took away 1500 + hdr_len
>>>>    from the allocation.
>>>> 2. set xdp
>>>> 3. alloc for new buffer
>>>>
>>>
>>> p = page_address(page) + offset;
>>> buf = p & PAGE_MASK; // whatever page p lands in is where buf is set
>>>
>>> => p and buf are always in the same page, no?
>>
>> I don't think it is, it's entirely possible to split on two pages.
>>
>>>
>>>> The buffer allocated in the third step must be unaligned, and it is entirely
>>>> possible that p and buf are not on the same page.
>>>>
>>>> I fixed my previous patch.
>>>>
>>>> Thanks.
>>>>
>>>> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
>>>> index 87838cbe38cf..d95e82255b94 100644
>>>> --- a/drivers/net/virtio_net.c
>>>> +++ b/drivers/net/virtio_net.c
>>>> @@ -1005,6 +1005,8 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
>>>>                          * xdp.data_meta were adjusted
>>>>                          */
>>>>                         len = xdp.data_end - xdp.data + vi->hdr_len + metasize;
>>>> +
>>>> +                       headroom = xdp.data - vi->hdr_len - metasize - (buf - headroom);
>>>
>>> This is wrong, xdp.data isn't related to buf in the xdp_linearize_page() case.
>>
>> Yes, you are right. For the case of xdp_linearize_page() , we should change it.
>>
>>    headroom = xdp.data - vi->hdr_len - metasize - page_address(xdp_page);
>>
>> Thanks.
>>
> 
> That is equal to offset:
>                        offset = xdp.data - page_address(xdp_page) -
>                                  vi->hdr_len - metasize;
> 
> So I do agree that it will work, it is effectively what I also suggested in the
> other email and it will be equal to just doing buf = page_address() in the xdp_linearize
> case because p = page_address + offset, and now we do buf = p - headroom where headroom also
> equals offset, so we get buf = page_address().
> 

All of the above is equivalent to:
diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 87838cbe38cf..12e88980e4b3 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1012,8 +1012,10 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
                                head_skb = page_to_skb(vi, rq, xdp_page, offset,
                                                       len, PAGE_SIZE, false,
                                                       metasize,
-                                                      VIRTIO_XDP_HEADROOM);
+                                                      offset);
                                return head_skb;
+                       } else {
+                               headroom = xdp.data - (buf - headroom) - vi->hdr_len - metasize;
                        }
                        break;
                case XDP_TX:

I agree with that, it is also equivalent to my proposal in the other email. It adjusts the new
headroom after the xdp prog which is ok. I'll wait (and test it in the meantime) for other
feedback and if all agree I'll post v2.

>>
>>>
>>>>                         /* We can only create skb based on xdp_page. */
>>>>                         if (unlikely(xdp_page != page)) {
>>>>                                 rcu_read_unlock();
>>>> @@ -1012,7 +1014,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
>>>>                                 head_skb = page_to_skb(vi, rq, xdp_page, offset,
>>>>                                                        len, PAGE_SIZE, false,
>>>>                                                        metasize,
>>>> -                                                      VIRTIO_XDP_HEADROOM);
>>>> +                                                      headroom);
>>>>                                 return head_skb;
>>>>                         }
>>>>                         break;
>>>
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
