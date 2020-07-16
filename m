Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DAD221FBF
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 11:34:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6655488EA2;
	Thu, 16 Jul 2020 09:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VObWkNh9NkZ5; Thu, 16 Jul 2020 09:34:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE37588EB9;
	Thu, 16 Jul 2020 09:34:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF7A9C08A5;
	Thu, 16 Jul 2020 09:34:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06DC5C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EAD7F88EBA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGHDThpO3QaQ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:34:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ACCAE88E9F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594892043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6g2OHR+BsacjutUeHKRjrJAFmPA9Puc/oQ6TqLDASLo=;
 b=hta25pYeaucVc5Oe1u2UUZrut84XfSJm92nRFfeUAt1J8/iL15KOga0+fxAwvduOngOqWR
 BUi21S/jvkjlIrAAFXXn+CvkgWS7YnzRbZ+kbsQrUsRN/spfoYbNTAncFkZnbAHNLS35+8
 4uqGId78ikEv0TjVyOU9KUeA+bGpR5Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-QhlNCApFOBSUdhP4Embmyw-1; Thu, 16 Jul 2020 05:34:01 -0400
X-MC-Unique: QhlNCApFOBSUdhP4Embmyw-1
Received: by mail-wr1-f72.google.com with SMTP id f5so5280927wrv.22
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 02:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6g2OHR+BsacjutUeHKRjrJAFmPA9Puc/oQ6TqLDASLo=;
 b=J9cGkVcNDBrzJuzNDJ4grMXIgYt5fO5AeRQas9YnR8rClM4yYR9HscOwGt8gtGweyM
 V8W8LfbOsrNozILE3owcL6E97ZDZRRz14NhOhJISPizAik7bNC9q8jSXbvx758Mpt1cA
 i/2OLKotl5ko83bNHAKYRPdqfk1GvZ5A8sGoDh2X4QdQG2SuvBGzNyavDCwnLDffPemZ
 G9QMUTnKAo+FGxjmXMYgqHXBQQbKR72Ajye2pv962PULfb1Se29Mc6oq6Dq1+SrkdiNi
 wjFoZWV27BgujRMkVKyehV7gpnDT0YAzoRACmKokdivurnGV4GLpKjw+NgiuwAVd3y4T
 NO3A==
X-Gm-Message-State: AOAM530JBRUjnu6RH20FPuhO1qi0lQ5Iz7djeps1Gh8Mpm3A5EXOaEpE
 yFLx0xDtUzdwz1BkXurIAHK01oQ0kt9z90bfY9J3WJu3CqzuUQhLwZrDWDFwKnIegvZcJLsW+td
 nHr/VPOf9pZ3Y66Krc6BEXi5/A9Kws3nFYgTOm9stUg==
X-Received: by 2002:adf:ee0b:: with SMTP id y11mr4421924wrn.360.1594892040140; 
 Thu, 16 Jul 2020 02:34:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgQg7MIxBtYOivVGHxvJIQOts6rRlOElVxLufJKb2tdgXQ122O9mPHOPYRTI54flIJSGDvpg==
X-Received: by 2002:adf:ee0b:: with SMTP id y11mr4421895wrn.360.1594892039857; 
 Thu, 16 Jul 2020 02:33:59 -0700 (PDT)
Received: from steredhat ([5.180.207.22])
 by smtp.gmail.com with ESMTPSA id w128sm8628518wmb.19.2020.07.16.02.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 02:33:58 -0700 (PDT)
Date: Thu, 16 Jul 2020 11:33:44 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: Interesting qemu/virt-manager bug about the "rotational"
 attribute on virtio-blk disks
Message-ID: <20200716093344.7molwklwco4sdtvs@steredhat>
References: <20200716080614.GA18456@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200716080614.GA18456@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-discuss@nongnu.org
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

+Cc Michael, Stefan, virtualization@lists.linux-foundation.org

On Thu, Jul 16, 2020 at 09:06:14AM +0100, Richard W.M. Jones wrote:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1857515
> 
> A virtio-blk disk which is backed by a raw file on an SSD,
> inside the guest shows rotational = 1.
> 
> I assumed that qemu must have a "rotational" property for disks and
> this would be communicated by virtio to the guest, but qemu and virtio
> don't seem to have this.  Pretty surprising!  Is it called something
> other than "rotational"?
> 

I'm not sure if we need to add this property in QEMU, but in Linux
I found these flags (include/linux/blkdev.h) for the block queues:

    #define QUEUE_FLAG_NONROT	6	/* non-rotational device (SSD) */
    #define QUEUE_FLAG_VIRT		QUEUE_FLAG_NONROT /* paravirt device */

xen-blkfront driver is the only one that sets the QUEUE_FLAG_VIRT,
should we do the same in the virtio-blk driver regardless of the backend?

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
