Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7C4174C29
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 08:32:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7520C872CA;
	Sun,  1 Mar 2020 07:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2PDFWywEViF; Sun,  1 Mar 2020 07:32:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 047AB8723F;
	Sun,  1 Mar 2020 07:32:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE6E8C013E;
	Sun,  1 Mar 2020 07:32:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 084DAC013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 07:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E87028A12A
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 07:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yu75z-UxCTzX
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 07:32:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C29C889F62
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583047959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3MMtrcMRfqYU2oZvn0CHa1Q2NrFI6ZpcljGvsY/uNA=;
 b=ApgXQzmLXHVWI3QHFWppZil2bnB6s+S775AUaZtNz2cSZUFnWnRbJT221no23YwpzjiW4h
 rQ8Dy4/0wfa3CrRqTle+XEeAy8iBhipyc+IxbjMOTZ0CCTOmW4ESd1LMwhHAhnKup6A9YW
 zrdQKZgnJxjV8D7t7arYIqlrkJBHz/I=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-Kw7c_1p4O2KYfhdJ8UMzQA-1; Sun, 01 Mar 2020 02:32:37 -0500
X-MC-Unique: Kw7c_1p4O2KYfhdJ8UMzQA-1
Received: by mail-qt1-f197.google.com with SMTP id o24so6631990qtr.17
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 23:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A3MMtrcMRfqYU2oZvn0CHa1Q2NrFI6ZpcljGvsY/uNA=;
 b=Pfa+NTH/gwdDShBikwrN125p98yCw2FNlq1p3LdnyG8e5EfDLBR0rrHu1WJA7Dd+3k
 4+XHbDahtMB9N/Grmf/JrMU1oFMCjrwrgFNtcviFu8TcAmR9eC58ne4DIHgEunOf68Uu
 sx7CPGeJIP7247O/hBVFwrI/hSe2S2jBYuH6aa7qagk6DltPInf9me4oCyW1OC7NjoQt
 6S13PA6j7T0u/qKR7xVgig+/Y4txxGMXnxXyatvGKdhENGKB/Wuzm8qjecLv07IkpxHv
 zQHx7lHV438IPu8GL4PN5GbYtigZT6tDG9IlZeIoOjVwF/ZOGFxQffE9seL6togMYJA/
 99cg==
X-Gm-Message-State: APjAAAULZGZU4a4sy/ANJak+vhVPhHIc2tOkGr5LQqj/tzPoFHIlwrE9
 /1doKZRIHwhbwMFPSOC5hTuB7xnS59N4UUZgLjgWDi5yuZvEoZyvosaWreoMcHapvuAXwpz9ndX
 KXaMNVMHLR6f85ebRxXFE8po7nJxmz2W+iZBtjVHXVg==
X-Received: by 2002:aed:2961:: with SMTP id s88mr9089086qtd.292.1583047957507; 
 Sat, 29 Feb 2020 23:32:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4o0NEf1dzwXYaj5wYtjW9Bg5oEwnhhA9tWLJVrxErw/9mkSdYS/F6D4AtFN66bw9c8E/rYg==
X-Received: by 2002:aed:2961:: with SMTP id s88mr9089075qtd.292.1583047957280; 
 Sat, 29 Feb 2020 23:32:37 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id f26sm7779304qtv.77.2020.02.29.23.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Feb 2020 23:32:35 -0800 (PST)
Date: Sun, 1 Mar 2020 02:32:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ram Muthiah <rammuthiah@google.com>
Subject: Re: [PATCH RESEND] virtio: virtio_pci_legacy: Remove default y from
 Kconfig
Message-ID: <20200301023025-mutt-send-email-mst@kernel.org>
References: <20200228232736.182780-1-rammuthiah@google.com>
MIME-Version: 1.0
In-Reply-To: <20200228232736.182780-1-rammuthiah@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Fri, Feb 28, 2020 at 03:27:36PM -0800, Ram Muthiah wrote:
> The legacy pci driver should no longer be default enabled. QEMU has
> implemented support for Virtio 1 for virtio-pci since June 2015
> on SHA dfb8e184db75.
> 
> Signed-off-by: Ram Muthiah <rammuthiah@google.com>

I see little reason to do this: y is safer and will boot on more
hypervisors, so people that aren't sure should enable it.

> ---
>  drivers/virtio/Kconfig | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> index 078615cf2afc..eacd0b90d32b 100644
> --- a/drivers/virtio/Kconfig
> +++ b/drivers/virtio/Kconfig
> @@ -26,7 +26,6 @@ config VIRTIO_PCI
>  
>  config VIRTIO_PCI_LEGACY
>  	bool "Support for legacy virtio draft 0.9.X and older devices"
> -	default y
>  	depends on VIRTIO_PCI
>  	---help---
>            Virtio PCI Card 0.9.X Draft (circa 2014) and older device support.
> @@ -36,11 +35,6 @@ config VIRTIO_PCI_LEGACY
>  	  If disabled, you get a slightly smaller, non-transitional driver,
>  	  with no legacy compatibility.
>  
> -          So look out into your driveway.  Do you have a flying car?  If
> -          so, you can happily disable this option and virtio will not
> -          break.  Otherwise, leave it set.  Unless you're testing what
> -          life will be like in The Future.
> -
>  	  If unsure, say Y.
>  
>  config VIRTIO_PMEM
> -- 
> 2.25.0.265.gbab2e86ba0-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
