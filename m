Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B6521B34B
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 12:41:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EC2638980A;
	Fri, 10 Jul 2020 10:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ss2OamIrVDLC; Fri, 10 Jul 2020 10:41:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 77ADC89868;
	Fri, 10 Jul 2020 10:41:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33E27C016F;
	Fri, 10 Jul 2020 10:41:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 695AFC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 58048204D9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rkXjNwKCIzL
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:41:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id E3379203E7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594377670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M5UoexhzgRrAQFFaSl1hdl1q9CRBScTX0FXbMUBveCI=;
 b=eRwoJcK6hdDc+hOaGICmQTPpdO5r/iZPx8k1zzTfIO78GoVH04C6vslUOll+gA5gGK2xME
 5IHf+4RI7henkk0J4/VGvRL6TczTFaIBQpjhlJ2dJO0UL9xiIiSxKqn1QMff09BghQ/ETV
 4Zr2fCgcHCJbqFUcPgYzVRS0QNAaesM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-PAr-37LYOpSTMaMQxaimbw-1; Fri, 10 Jul 2020 06:41:08 -0400
X-MC-Unique: PAr-37LYOpSTMaMQxaimbw-1
Received: by mail-wr1-f71.google.com with SMTP id f5so5589915wrv.22
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 03:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M5UoexhzgRrAQFFaSl1hdl1q9CRBScTX0FXbMUBveCI=;
 b=eUfO3+M7lCSgUID3pIA5rBmTFVVQU+uzY36/oYh7qB0//np9nGZjyxmF8kUHqtfsb9
 uXznNCgAs0PpLywIsWmF+J4YD09AJ4Ux3yjDvuLrqTqcBfhqjSUSmJQw23WNzrwL/bON
 UL0fhrDjUggzScRG9r6JDEHzP/H3HkFzqCEjrLCdtpYtqa1spCEpaz0E7c2iryqZO2rC
 U97CeJijfvqAxmjchjyZto62tzBjc/bmLoMn6EbIweO1z/gZlPUK92J6xmw7Ki+5IGV2
 FR9e7aW4SAL0Kb5SGBTdqT1kyBtJRVuDHP3zBZeLIiy9uBYid8wo+dEqW+a+b0YzWonG
 9Jeg==
X-Gm-Message-State: AOAM532xCA1KDUun8915c4i6gDu36wFFCu8+9sv67AoCMwH1wwiz5GkA
 XEQOGluN0NcmvaYv1FUTHdDx9bxSSTreqEuHW2B8WxryfTTOFlnNfm6Rh01y3lXnsi7dGVqIJmo
 2DmPE5/q4lWMSI4rT7/cuAvk4z2G89tFyXRMt8yuMBQ==
X-Received: by 2002:a05:6000:100c:: with SMTP id
 a12mr73370693wrx.81.1594377667547; 
 Fri, 10 Jul 2020 03:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy60ZO1zYTbHETQQGS7sTCxEg96DLLGgaiDRsvrtRzD6t2/yqpDL9PBSe+Ke7VB4naljKUhBQ==
X-Received: by 2002:a05:6000:100c:: with SMTP id
 a12mr73370675wrx.81.1594377667270; 
 Fri, 10 Jul 2020 03:41:07 -0700 (PDT)
Received: from steredhat ([5.171.236.20])
 by smtp.gmail.com with ESMTPSA id u1sm11353994wrb.78.2020.07.10.03.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:41:06 -0700 (PDT)
Date: Fri, 10 Jul 2020 12:41:03 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: sparse warnings in net/vmw_vsock/virtio_transport.c
Message-ID: <20200710104103.qp47ml6rgsr4l6t7@steredhat>
References: <20200710062421-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200710062421-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, stefanha@redhat.com,
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

On Fri, Jul 10, 2020 at 06:24:51AM -0400, Michael S. Tsirkin wrote:
> RCU trickery:
> 
> net/vmw_vsock/virtio_transport.c:73:17: error: incompatible types in comparison expression (different address spaces):
> net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock [noderef] __rcu *
> net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock *
> net/vmw_vsock/virtio_transport.c:171:17: error: incompatible types in comparison expression (different address spaces):
> net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock [noderef] __rcu *
> net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock *
> net/vmw_vsock/virtio_transport.c:207:17: error: incompatible types in comparison expression (different address spaces):
> net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock [noderef] __rcu *
> net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock *
> net/vmw_vsock/virtio_transport.c:561:13: error: incompatible types in comparison expression (different address spaces):
> net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock [noderef] __rcu *
> net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock *
> net/vmw_vsock/virtio_transport.c:612:9: error: incompatible types in comparison expression (different address spaces):
> net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock [noderef] __rcu *
> net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock *
> net/vmw_vsock/virtio_transport.c:631:9: error: incompatible types in comparison expression (different address spaces):
> net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock [noderef] __rcu *
> net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock *
>   CC [M]  net/vmw_vsock/virtio_transport.o
> 
> can you take a look at fixing this pls?

Thanks for reporting!

We should annotate 'the_virtio_vsock' with __rcu.

I'll send a patch to fix these warnings.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
