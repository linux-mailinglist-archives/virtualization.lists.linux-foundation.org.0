Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 232E150D272
	for <lists.virtualization@lfdr.de>; Sun, 24 Apr 2022 16:53:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3615415D7;
	Sun, 24 Apr 2022 14:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4uBiJ5unwc6; Sun, 24 Apr 2022 14:53:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C20C6415C5;
	Sun, 24 Apr 2022 14:53:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39A9AC002D;
	Sun, 24 Apr 2022 14:53:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F75AC002D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 14:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A99F81CA7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 14:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=blackwall-org.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdMF-OuDQxhh
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 14:53:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05C5C81CA3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 14:53:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id kq17so1931837ejb.4
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 07:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackwall-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FSdZ0EyibnPl6YT5BPXSx2licUaKCWt4bsCgOsnNmbs=;
 b=cEgn8A/O1H9H+dljfA0EHahDbm8xweR+PBmjeE/tslJYO7M5LAALrv40xHWj5tRgzj
 QUeU5t+g7yligkmFEpWyS9oOd12tjyuQWe9u23EC9Yfn6O+IEhyZm7IVaotizt1G61Lj
 wqmF8lIbozjr9VAOwl3Dh3esd6XTXom0IYWDm/46S7rkhSDsE5FriTGBZXYRNBjXJwp5
 akPvfUi7vx2/KeQcQ2x68XhmbZiR0VP+BkmUHO5rF7q/+cckwZ+TZZmpqm1d3VPTc8yF
 RceUXmt4gQrlXK24K/bn6k28xIKbzzdbYRNB+h3fGlkiSVHjvupqvCns72EZ6+V6M2gA
 IebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FSdZ0EyibnPl6YT5BPXSx2licUaKCWt4bsCgOsnNmbs=;
 b=6mvoUfN2TkmziJUQ6qOGCXjOVYdzF9kQqr2HpT+g0yV9DLbCVNnZgr6B83r+B+IePF
 SMIaiZF0O1cxBKHnEWjDGuvWLKKDF+wdxhVwpwfLKvnn2xYlTUlDrM3UVtw5AfTwBzR3
 1sHx/WbqiD6FfvpM2gwOorHC7gBXej5DtBB83ir65mVZCadOfDGVKAHEgwRLZ8uQIEjH
 AmSISXNLjkabnsHw4HGV1bkQEX33peL2a7hUGGY/HX+egfcAsWsytyYBlhDlex6VIwT+
 PvfQUq0g3VZuxkTnCGFnfgn5DmCtEaQHmQ5MjHypUtp4vXPMov9drvOD94KmnwEKC2Fp
 a1NQ==
X-Gm-Message-State: AOAM5301Q002yPfyZUWDKZ1ouEUyE6WZtg9+Ae6hQ2AAnsemwkS5+uIs
 +udGu6qmKB6BTIzOwDaVPwuJbw==
X-Google-Smtp-Source: ABdhPJwWjaofBEbFz/c/hWVLkFBaESJwklRq20VejH/s4tBbb7ui2abSGJ3PTtuJRwRZ9UFJK++SZQ==
X-Received: by 2002:a17:906:9b85:b0:6e0:5c22:f0df with SMTP id
 dd5-20020a1709069b8500b006e05c22f0dfmr12285346ejc.114.1650811995827; 
 Sun, 24 Apr 2022 07:53:15 -0700 (PDT)
Received: from [192.168.0.111] (87-243-81-1.ip.btc-net.bg. [87.243.81.1])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b006cee1bceddasm2629473ejn.130.2022.04.24.07.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 07:53:15 -0700 (PDT)
Message-ID: <540a850d-11f3-5d14-a9e7-0cf78e878b75@blackwall.org>
Date: Sun, 24 Apr 2022 17:53:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH net v2] virtio_net: fix wrong buf address calculation when
 using xdp
Content-Language: en-US
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20220423112612.2292774-1-razor@blackwall.org>
 <1650720683.8168066-1-xuanzhuo@linux.alibaba.com>
 <8d511a16-8d69-82b1-48a1-24de3a592aef@blackwall.org>
 <a58bfd2c-4f83-11fe-08d1-19c1d6497fc2@blackwall.org>
 <1650724608.256497-2-xuanzhuo@linux.alibaba.com>
 <c206c147-ad7e-b615-2e96-572482335563@blackwall.org>
 <1650726113.2334588-1-xuanzhuo@linux.alibaba.com>
 <ff95db6e-5a0a-7e63-080f-c719ac434c34@blackwall.org>
 <c7e49737-c5f8-5164-88ad-599c828c5d23@blackwall.org>
 <20220424102121.2686893-1-razor@blackwall.org>
 <1650796959.4611728-1-xuanzhuo@linux.alibaba.com>
 <94172c53-2919-9eab-7933-91a78bdb87f0@blackwall.org>
 <1650799132.122562-1-xuanzhuo@linux.alibaba.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <1650799132.122562-1-xuanzhuo@linux.alibaba.com>
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

On 24/04/2022 14:18, Xuan Zhuo wrote:
> On Sun, 24 Apr 2022 13:56:17 +0300, Nikolay Aleksandrov <razor@blackwall.org> wrote:
>> On 24/04/2022 13:42, Xuan Zhuo wrote:
>>> On Sun, 24 Apr 2022 13:21:21 +0300, Nikolay Aleksandrov <razor@blackwall.org> wrote:
[snip]
>>>>
>>>> CC: stable@vger.kernel.org
>>>> CC: Jason Wang <jasowang@redhat.com>
>>>> CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>>> CC: Daniel Borkmann <daniel@iogearbox.net>
>>>> CC: "Michael S. Tsirkin" <mst@redhat.com>
>>>> CC: virtualization@lists.linux-foundation.org
>>>> Fixes: 8fb7da9e9907 ("virtio_net: get build_skb() buf by data ptr")
>>>> Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
>>>> ---
>>>> v2: Recalculate headroom based on data, data_hard_start and data_meta
>>>>
>>>>  drivers/net/virtio_net.c | 8 +++++++-
>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
>>>> index 87838cbe38cf..a12338de7ef1 100644
>>>> --- a/drivers/net/virtio_net.c
>>>> +++ b/drivers/net/virtio_net.c
>>>> @@ -1005,6 +1005,12 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
>>>>  			 * xdp.data_meta were adjusted
>>>>  			 */
>>>>  			len = xdp.data_end - xdp.data + vi->hdr_len + metasize;
>>>> +
>>>> +			/* recalculate headroom if xdp.data or xdp.data_meta
>>>> +			 * were adjusted
>>>> +			 */
>>>> +			headroom = xdp.data - xdp.data_hard_start - metasize;
>>>
>>>
>>> This is incorrect.
>>>
>>>
>>> 		data = page_address(xdp_page) + offset;
>>> 		xdp_init_buff(&xdp, frame_sz - vi->hdr_len, &rq->xdp_rxq);
>>> 		xdp_prepare_buff(&xdp, data - VIRTIO_XDP_HEADROOM + vi->hdr_len,
>>> 				 VIRTIO_XDP_HEADROOM, len - vi->hdr_len, true);
>>>
>>> so: xdp.data_hard_start = page_address(xdp_page) + offset - VIRTIO_XDP_HEADROOM + vi->hdr_len
>>>
>>> (page_address(xdp_page) + offset) points to virtio-net hdr.
>>> (page_address(xdp_page) + offset - VIRTIO_XDP_HEADROOM) points to the allocated buf.
>>>
>>> xdp.data_hard_start points to buf + vi->hdr_len
>>>
>>> Thanks.
>>>
>>
>> xdp.data points to buf + vi->hdr_len + VIRTIO_XDP_HEADROOM, so we calculate
>> xdp.data - xdp.data_hard_start, i.e. buf + vi->hdr_len + VIRTIO_XDP_HEADROOM - (buf + vi->hdr_len)
>>
>> You can see the headrooms from my tests above, they are correct and they match exactly
>> the values from the headroom calculations that you suggested earlier.
> 
> 
> OK. You are right, xdp.data, xdp.data_hard_start have an offset of hdr_len. I
> hope this can be explained in the comments, because the headroom we want to get
> is virtio_hdr - buf. Although the value here are equal.
> 

I think it's normal for them to be equal because buf + offset points to vnet_hdr start,
that is it doesn't include the vnet_hdr size, so all that is left to subtract to get
to buf is offset - headroom after the prepare (given correct headroom, of course). 
The linearized xdp page buf has the following initial geometry (at prepare):
 offset = VIRTIO_XDP_HEADROOM
 headroom = VIRTIO_XDP_HEADROOM
 data_hard_start = page_address + vnet_hdr
 data = page_address + vnet_hdr + headroom
 data_meta = data

after xdp prog has run:
offset is recalculated as: (page_address + vnet_hdr + adjusted headroom) - page_address -
                            vnet_hdr - metasize = adjusted headroom - metasize

I wrote adjusted headroom because it depends on data and data_meta adjustments done by
the xdp prog, so based on the above we can get back to page_address (or buf if it's a virtnet
buf) by subtracting the following headroom recalculation:
 headroom = data - data_hard_start - metasize =
 (page_address + vnet_hdr + adjusted headroom) - page_address - vnet_hdr - metasize =
 adjusted headroom - metasize

That is because in page_to_skb() p points to page_address + recalculated offset, i.e.
p = page_address + (adjusted headroom - metasize) for the linearized case.
For the other case it's the same just the initial offset is a larger value.

I'll add a comment that page_address + offset always points to vnet_hdr start so
it will be equal to headroom which is data - data_hard_start because we have
data = page_address + vnet_hdr + adjusted headroom and data_hard_start at page_address
+ vnet_hdr. Note that we have adjusted headroom + vnet_hdr bytes available behind data
always, so for offset to point to vnet_hdr it has to be equal to headroom, it just
starts at page_address while the actual headroom starts at page_address + vnet_hdr to
reserve that many bytes.

I'll see how I can make that more concise. :)

> In addition, if you are going to post v2, I think you should post a new thread
> separately instead of replying in the previous thread.
> 

sure, I don't mind either way

> Thanks.
> 
> 

Cheers,
 Nik

>>
>>>
>>>> +
>>>>  			/* We can only create skb based on xdp_page. */
>>>>  			if (unlikely(xdp_page != page)) {
>>>>  				rcu_read_unlock();
>>>> @@ -1012,7 +1018,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
>>>>  				head_skb = page_to_skb(vi, rq, xdp_page, offset,
>>>>  						       len, PAGE_SIZE, false,
>>>>  						       metasize,
>>>> -						       VIRTIO_XDP_HEADROOM);
>>>> +						       headroom);
>>>>  				return head_skb;
>>>>  			}
>>>>  			break;
>>>> --
>>>> 2.35.1
>>>>
>>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
