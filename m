Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB471BD3DB
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 06:58:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 50D6022D55;
	Wed, 29 Apr 2020 04:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5KZxffqy6wD1; Wed, 29 Apr 2020 04:57:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 650BA22CC7;
	Wed, 29 Apr 2020 04:57:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40BD9C0172;
	Wed, 29 Apr 2020 04:57:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12246C0888
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 04:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F283C8758D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 04:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOe1chO+bx5m
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 04:57:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3B84A87598
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 04:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588136270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3nNJuKtjgttr9/75Tz29rm+bXY1XXpiZYQWZLWivAVY=;
 b=bzpsXmcN7/txQGw++B4c5Q3s4BRmz6ykAaHzuZWWc2cz89BvEZrerX/g4OLNvjV2qDooFr
 dWXjzpS/uMkWbO7ukBz6OS4hzh7Q3LrFRDKOGL6hgRS63qm22d9wEbVIiiGBXH01TqBYrp
 WZ2o6hzpNYXoUF2Vo8dpNz0E4qy5TzQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-xYvw-sa4Ok2gy2VoAr3R4A-1; Wed, 29 Apr 2020 00:57:48 -0400
X-MC-Unique: xYvw-sa4Ok2gy2VoAr3R4A-1
Received: by mail-wr1-f71.google.com with SMTP id d17so1087131wrr.17
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 21:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3nNJuKtjgttr9/75Tz29rm+bXY1XXpiZYQWZLWivAVY=;
 b=ISVYfwPAVrhZZVhBPQ6t1HHw7myjfTS9U5QMc6Gop0MPjtBevYqy6HseN4QA3k6ouD
 mScq+1X341oIPQyCxYHlDdhFPmhWgJRN1MfmNf1YzL1mVktb8H3917o8n5EFZY9i4SUV
 iTXgTFDbfNK43HK6xbH6OFGXrsUmwR+x8hjAEGQKR/YG7QsbRIo0u4WdNYMrP7e2Fs2m
 HJ0b0Jl8C7nmmdzndqAwIdZjp9pXecPoK1/Y85ueqQBLuzI55l71izsZvGqEEFdG1zdm
 uQMk412rhKHxTuy5YveNMQAHEt+EVOcVYSRoCec+Hhd06c7XvUWtGVYbgs8a62t84MPH
 NHCg==
X-Gm-Message-State: AGi0PuZ447WLP3Hf84Mk/UjS0zJczwM2F7uqXHmv122s355YJYiCgJN+
 hnvSgsbGC9zgqH0DV3AdBn64Gcx3sy1SWQHp8c6JxFqr0SVfua7Y/Ws78vQn7IZuv3eHRKBxOM1
 hXNRWEr392fFElZ+RIIhc4eUc2rY42mGWLVIZUBhlWg==
X-Received: by 2002:adf:f884:: with SMTP id u4mr36138569wrp.171.1588136267212; 
 Tue, 28 Apr 2020 21:57:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypLIkFFOdPPZMhssIAseU7SHZrcOaozQItYfLHySNTFChvxRbYL5g64fDwfcVxKEgSHYYt1vng==
X-Received: by 2002:adf:f884:: with SMTP id u4mr36138548wrp.171.1588136267003; 
 Tue, 28 Apr 2020 21:57:47 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 h17sm5885719wmm.6.2020.04.28.21.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 21:57:46 -0700 (PDT)
Date: Wed, 29 Apr 2020 00:57:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
Message-ID: <20200429004531-mutt-send-email-mst@kernel.org>
References: <1588073958-1793-1-git-send-email-vatsa@codeaurora.org>
 <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
 <20200428121232-mutt-send-email-mst@kernel.org>
 <20200428174952.GA5097@quicinc.com>
 <20200428163448-mutt-send-email-mst@kernel.org>
 <275eba4b-dd35-aa95-b2e3-9c5cbf7c6d71@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <275eba4b-dd35-aa95-b2e3-9c5cbf7c6d71@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org, will@kernel.org,
 konrad.wilk@oracle.com, jan.kiszka@siemens.com,
 Srivatsa Vaddagiri <vatsa@codeaurora.org>, christoffer.dall@arm.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 stefano.stabellini@xilinx.com, linux-kernel@vger.kernel.org,
 pratikp@codeaurora.org
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

On Wed, Apr 29, 2020 at 10:22:32AM +0800, Lu Baolu wrote:
> On 2020/4/29 4:41, Michael S. Tsirkin wrote:
> > On Tue, Apr 28, 2020 at 11:19:52PM +0530, Srivatsa Vaddagiri wrote:
> > > * Michael S. Tsirkin<mst@redhat.com>  [2020-04-28 12:17:57]:
> > > 
> > > > Okay, but how is all this virtio specific?  For example, why not allow
> > > > separate swiotlbs for any type of device?
> > > > For example, this might make sense if a given device is from a
> > > > different, less trusted vendor.
> > > Is swiotlb commonly used for multiple devices that may be on different trust
> > > boundaries (and not behind a hardware iommu)?
> > Even a hardware iommu does not imply a 100% security from malicious
> > hardware. First lots of people use iommu=pt for performance reasons.
> > Second even without pt, unmaps are often batched, and sub-page buffers
> > might be used for DMA, so we are not 100% protected at all times.
> > 
> 
> For untrusted devices, IOMMU is forced on even iommu=pt is used;

I think you are talking about untrusted *drivers* like with VFIO.

On the other hand, I am talking about things like thunderbolt
peripherals being less trusted than on-board ones.

Or possibly even using swiotlb for specific use-cases where
speed is less of an issue.

E.g. my wifi is pretty slow anyway, and that card is exposed to
malicious actors all the time, put just that behind swiotlb
for security, and leave my graphics card with pt since
I'm trusting it with secrets anyway.


> and
> iotlb flush is in strict mode (no batched flushes); ATS is also not
> allowed. Swiotlb is used to protect sub-page buffers since IOMMU can
> only apply page granularity protection. Swiotlb is now used for devices
> from different trust zone.
> 
> Best regards,
> baolu

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
