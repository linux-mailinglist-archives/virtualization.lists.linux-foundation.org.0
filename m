Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D95CA123651
	for <lists.virtualization@lfdr.de>; Tue, 17 Dec 2019 21:05:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 669E688035;
	Tue, 17 Dec 2019 20:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vVOZlxqsxuo; Tue, 17 Dec 2019 20:05:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5BD7D87EC5;
	Tue, 17 Dec 2019 20:05:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DF15C077D;
	Tue, 17 Dec 2019 20:05:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A14BC077D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1376088026
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6oXrRYlIakd4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:05:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E2B1187EC5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576613100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HWdA+yfSq9vVscO+Wekm5LzdNfPZX2WaPIzhQ0l4NGs=;
 b=H8HL9gOidCvBWXB6ZljkrTFEJDd3Ura5ht2jPSwWqB+zOyNp6qfjABVLf8iGD87OAzAbj8
 1l2dMSTMLi9JibCXIIr4/x+fnesevh5aiB01JWLaLK5/rdu7fZQi1DZOYgM4YL2gEb2sgC
 myIzN6+BnuzJD9WBLuqDYXWPn1J3X2M=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-uRv4jFTnM2W1T6KIQi9sXw-1; Tue, 17 Dec 2019 15:04:58 -0500
Received: by mail-qt1-f200.google.com with SMTP id o18so7677813qtt.19
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 12:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HWdA+yfSq9vVscO+Wekm5LzdNfPZX2WaPIzhQ0l4NGs=;
 b=DdFJQsUVueHFpBnYX+JdzSEZ7WqZkSGC7V0dofxj4ZrG9iU42SP85jxVJeKraDKdq/
 pZelixKJ05d6VHn1+6A+DlfnmFceCEPFvFwM0VcGns6Om5ubLuu5zi9Og6YB8O9xFrVg
 /AlUDxEYP14UWIG9t7gVPUUnjjrsNQVi6moqRe6a4sMagPcKkVeshoH/LJThTx4SUTN2
 bX12nXx+CowHQxVYiL6Yfpf1VaKh4ReV3foYBAI3s8Y0P/1nu85C+cnV205F9IVjzbzl
 iKYwKi3avSl5yZ7OoMHo+R4ygJJ8P/6/0I49D3mnD6CVfpAsptNbBemEwpakhSDMDrcf
 nEsA==
X-Gm-Message-State: APjAAAX2hFhZ+xarCCtqJCR+q0q7PUTeLHkO8uqJKhuyLzcWGWLf9Afr
 V7ccH/gR/9EaY0d0IIuHhm4ocsQjIcLv1HtOj3OQWgoQgE4Upq2xts9NjWKj2FC8NYfquhtmuJD
 dSlgaHaOqqJ3SS5rOCTKhLcbFwLvIt4J53BQyltTrFA==
X-Received: by 2002:a37:7d01:: with SMTP id y1mr7124542qkc.452.1576613097640; 
 Tue, 17 Dec 2019 12:04:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqxTc40BocNsfFs8JjsvuH2fZBzj+gCBu4qtfZyQhDfJHwEnk7VBOO5sD+IvM3sRbkM5XaiSdg==
X-Received: by 2002:a37:7d01:: with SMTP id y1mr7124519qkc.452.1576613097399; 
 Tue, 17 Dec 2019 12:04:57 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id j7sm7296654qkd.46.2019.12.17.12.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 12:04:56 -0800 (PST)
Date: Tue, 17 Dec 2019 15:04:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH 2/2] virtio-pci: check name when counting MSI-X vectors
Message-ID: <20191217150139-mutt-send-email-mst@kernel.org>
References: <20191217190610.248061-1-dverkamp@chromium.org>
 <20191217190610.248061-2-dverkamp@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20191217190610.248061-2-dverkamp@chromium.org>
X-MC-Unique: uRv4jFTnM2W1T6KIQi9sXw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

On Tue, Dec 17, 2019 at 11:06:10AM -0800, Daniel Verkamp wrote:
> VQs without a name specified are not valid; they are skipped in the
> later loop that assigns MSI-X vectors to queues, but the per_vq_vectors
> loop above that counts the required number of vectors previously still
> counted any queue with a non-NULL callback as needing a vector.
> 
> Add a check to the per_vq_vectors loop so that vectors with no name are
> not counted to make the two loops consistent.  This prevents
> over-counting unnecessary vectors (e.g. for features which were not
> negotiated with the device).
> 
> Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>

And I'll add:
Fixes: 9564e138b1f6 ("virtio: Add memory statistics reporting to the balloon driver (V4)")

here too.

> ---
>  drivers/virtio/virtio_pci_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> index f2862f66c2ac..222d630c41fc 100644
> --- a/drivers/virtio/virtio_pci_common.c
> +++ b/drivers/virtio/virtio_pci_common.c
> @@ -294,7 +294,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
>  		/* Best option: one for change interrupt, one per vq. */
>  		nvectors = 1;
>  		for (i = 0; i < nvqs; ++i)
> -			if (callbacks[i])
> +			if (names[i] && callbacks[i])
>  				++nvectors;
>  	} else {
>  		/* Second best: one for change, shared for all vqs. */
> -- 
> 2.24.1.735.g03f4e72817-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
