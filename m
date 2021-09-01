Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF473FDEA2
	for <lists.virtualization@lfdr.de>; Wed,  1 Sep 2021 17:27:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F98C823C0;
	Wed,  1 Sep 2021 15:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54KNVslWaQIs; Wed,  1 Sep 2021 15:27:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2FED3827AA;
	Wed,  1 Sep 2021 15:27:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99DE0C001F;
	Wed,  1 Sep 2021 15:27:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD56BC000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Sep 2021 15:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C54EE606CB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Sep 2021 15:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zqra1TNqXSwN
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Sep 2021 15:27:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8321605FB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Sep 2021 15:27:02 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id i13so3704727ilm.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Sep 2021 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P4hWmiVCsoalS+MUxb6yp9qen+G/lJg4S4KtX6kUkIg=;
 b=bAVSIYQ+ja4RwQISg4uNNKJLNh45xtISDhVk9AR2uD9C8rzMnOwI7smTNyDDsjvVhp
 5lv/E6d/3OL3YUt7CYKIdA9UQOJTPCcGJC0rIsN3eAu9DGf2SzQkphQ9T5JuIkySfLPX
 8cOOZ3V4znimIUsO1BfrNI4Ctub7u3AviThY62yo8rYSfzQk3MYasYAdXaWcBS9Uu2W/
 fiTsLtF+iv8UIKeRRfZKzT4XaDuWDlrIQbs7dE+RI0oRYQoAPqdRmzarG9xvclxdYpCZ
 1YfnL+2c2MGnyUgjN33eQkWFnfrMgbyKqLp5piKS0lFyRs3ODqVW2i8bVKSCB0052vbM
 JB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P4hWmiVCsoalS+MUxb6yp9qen+G/lJg4S4KtX6kUkIg=;
 b=WVRicJvZ9Ehz4egWICQC5+eHbpSGvlrMDOcS4evdZWkAxoRwUNFdDsGtBd3vR4EBBX
 YXJakRHkkI2pDYQZuNCsFt5hQLhgRIqLRCSp7FIRJF0hragEnHpIso928Tp6TkiQ4mJ3
 L/RPmRr5ay4N67CfX+b0/lS0vnbGw48oFzFXisN+k0DZPwM9OG9DcKUZS5CERf48SWJf
 3otJ3eDZ/m68hD49NqsEZZN91wVWETVmmhrFXGiSWGiWk1DY7siqjIUZS/+B8Jy0R6Xm
 ptpjzYmfCwx4Ut3Gb3y7G5B4jTXQk32K+J+AOPCz2RobyBBwX4kw4aHXNzYUdWab8GX7
 JoXw==
X-Gm-Message-State: AOAM530eosCLobOJ49/Gu9U2Fakn5XQffyFMfTmr2zQZMWg6wyrWuFHP
 52Du+CuJFSiqJuSaGtDA169tsA==
X-Google-Smtp-Source: ABdhPJzu7OecURDkdeuTRcdqGYhldWEarwW4nuDTPdc7m9jAK9+iiAPcpIvGYEtV9JmBvvSla+EqVA==
X-Received: by 2002:a92:c5cf:: with SMTP id s15mr80745ilt.62.1630510021791;
 Wed, 01 Sep 2021 08:27:01 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id c5sm175541ilr.54.2021.09.01.08.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 08:27:01 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] virtio-blk: avoid preallocating big SGL for data
To: Max Gurtovoy <mgurtovoy@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210901131434.31158-1-mgurtovoy@nvidia.com>
 <20210901102623-mutt-send-email-mst@kernel.org>
 <89d6dc30-a876-b1b0-4ff4-605415113611@nvidia.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <6a648daf-dd93-0c16-58d6-e4a59334bf0b@kernel.dk>
Date: Wed, 1 Sep 2021 09:27:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <89d6dc30-a876-b1b0-4ff4-605415113611@nvidia.com>
Content-Language: en-US
Cc: linux-block@vger.kernel.org, kvm@vger.kernel.org, israelr@nvidia.com,
 virtualization@lists.linux-foundation.org, hch@infradead.org,
 nitzanc@nvidia.com, stefanha@redhat.com, oren@nvidia.com
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

On 9/1/21 8:58 AM, Max Gurtovoy wrote:
> 
> On 9/1/2021 5:50 PM, Michael S. Tsirkin wrote:
>> On Wed, Sep 01, 2021 at 04:14:34PM +0300, Max Gurtovoy wrote:
>>> No need to pre-allocate a big buffer for the IO SGL anymore. If a device
>>> has lots of deep queues, preallocation for the sg list can consume
>>> substantial amounts of memory. For HW virtio-blk device, nr_hw_queues
>>> can be 64 or 128 and each queue's depth might be 128. This means the
>>> resulting preallocation for the data SGLs is big.
>>>
>>> Switch to runtime allocation for SGL for lists longer than 2 entries.
>>> This is the approach used by NVMe drivers so it should be reasonable for
>>> virtio block as well. Runtime SGL allocation has always been the case
>>> for the legacy I/O path so this is nothing new.
>>>
>>> The preallocated small SGL depends on SG_CHAIN so if the ARCH doesn't
>>> support SG_CHAIN, use only runtime allocation for the SGL.
>>>
>>> Re-organize the setup of the IO request to fit the new sg chain
>>> mechanism.
>>>
>>> No performance degradation was seen (fio libaio engine with 16 jobs and
>>> 128 iodepth):
>>>
>>> IO size      IOPs Rand Read (before/after)         IOPs Rand Write (before/after)
>>> --------     ---------------------------------    ----------------------------------
>>> 512B          318K/316K                                    329K/325K
>>>
>>> 4KB           323K/321K                                    353K/349K
>>>
>>> 16KB          199K/208K                                    250K/275K
>>>
>>> 128KB         36K/36.1K                                    39.2K/41.7K
>>>
>>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>>> Reviewed-by: Israel Rukshin <israelr@nvidia.com>
>> Could you use something to give confidence intervals maybe?
>> As it is it looks like a 1-2% regression for 512B and 4KB.
> 
> 1%-2% is not a regression. It's a device/env/test variance.
> 
> This is just one test results. I run it many times and got difference by 
> +/- 2%-3% in each run for each sides.
> 
> Even if I run same driver without changes I get 2%-3% difference between 
> runs.
> 
> If you have a perf test suite for virtio-blk it will be great if you can 
> run it, or maybe Feng Li has.

You're adding an allocation to the hot path, and a free to the
completion hot path. It's not unreasonable to expect that there could be
performance implications associated with that. Which would be
particularly evident with 1 segment requests, as the results would seem
to indicate as well.

Probably needs better testing. A profile of a peak run before and after
and a diff of the two might also be interesting.

The common idiom for situations like this is to have an inline part that
holds 1-2 segments, and then only punt to alloc if you need more than
that. As the number of segments grows, the cost per request matters
less.

-- 
Jens Axboe

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
