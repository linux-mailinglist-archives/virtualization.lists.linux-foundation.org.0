Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3529B1A6584
	for <lists.virtualization@lfdr.de>; Mon, 13 Apr 2020 13:13:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DD481877E1;
	Mon, 13 Apr 2020 11:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZBmblfYSswG; Mon, 13 Apr 2020 11:13:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4BFCB86E48;
	Mon, 13 Apr 2020 11:13:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E3B9C0172;
	Mon, 13 Apr 2020 11:13:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 763A5C0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 11:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 600B38702A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 11:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2i0mtvrxM5Bw
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 11:13:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B577F86E48
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 11:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586776412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eA+1OwrqtBFUycQoHwTFvjR2xgB9xOkRuOHd3tox9VQ=;
 b=Nt5BgESXd1GllIMniBDV6UWQT6IDcSJR+6OuEI0ePYbZiyS+Iw1sk0RtvwWbe1Y6nPUDFK
 ckzkSvkrqR+Ot1451/JscnNWdeJZgbNrzuID6RzOUJGe/22g1xTaPS5nevnpUwm5V33syu
 p8ZhbcjZOUYMafEAqQaLRWW/usBMYTQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-MTnhxcQpOHWImyb3A9oM4g-1; Mon, 13 Apr 2020 07:13:28 -0400
X-MC-Unique: MTnhxcQpOHWImyb3A9oM4g-1
Received: by mail-wr1-f71.google.com with SMTP id s11so1658496wru.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 04:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RyXK4jTSyCrBgQI/g3NhhWf4Cadu8DGaHr+KG4J9oBY=;
 b=CO0OE7t5oA+GKi/uv+1btIhTz1LQ0YNy4okElXlJd0iwTUukAUC8cyO4DxxwXNLsGj
 6gWLE/CIT0EKzLpdOcHNGNGZSD3zAP2FcDb2LiO9ZwLabx74JcrqmgVUSVlEJkP9XNim
 730lNwsOk5xL0Sg70cweDPlcBVKD1kgOgNhH9rf3djdV43K+NwzsDENsO/7zjJQvIxPN
 ttaglrJ9Pv9TzKz+q97muBMqtkJgkxPFkNsGSrDCp4TEQdTY7KJSOrqNvpFN1juK24xi
 dugbuprQ/tbnjXLglSy8cFub1xmuq/0K1OxmwM4DL4eHzS5HA/qLQuvLYJz9fgwtD2WN
 nIfw==
X-Gm-Message-State: AGi0PuZkX7uZ2U4xdFT6SmGqMd6qmeMdSC8vuItv7KzFg7jtb6HhI9OT
 HUZlZlieiAgaDVSDKsPvKst9Ty+TzCpYkUGyzeE2nRoD6+G62K3ZEqnqxcZy1TsuEuxVDUnAyb0
 YFO4398bq8ed36uLyBmA4wExJEUuwX84R5sZOVIRIfA==
X-Received: by 2002:a5d:4442:: with SMTP id x2mr181626wrr.101.1586776407145;
 Mon, 13 Apr 2020 04:13:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypJm7VAiU/q6lVzMdgLKKb2HWEjxDtZshQBgoe1KapbTIJWgwwS+QMx+dIDjpKr+0KXFEhxl+g==
X-Received: by 2002:a5d:4442:: with SMTP id x2mr181605wrr.101.1586776406923;
 Mon, 13 Apr 2020 04:13:26 -0700 (PDT)
Received: from redhat.com ([185.107.45.41])
 by smtp.gmail.com with ESMTPSA id b82sm15257603wme.25.2020.04.13.04.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 04:13:26 -0700 (PDT)
Date: Mon, 13 Apr 2020 07:13:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH 0/8] tools/vhost: Reset virtqueue on tests
Message-ID: <20200413071044-mutt-send-email-mst@kernel.org>
References: <20200403165119.5030-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200403165119.5030-1-eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Apr 03, 2020 at 06:51:11PM +0200, Eugenio P=C3=A9rez wrote:
> This series add the tests used to validate the "vhost: Reset batched
> descriptors on SET_VRING_BASE call" series, with a small change on the
> reset code (delete an extra unneded reset on VHOST_SET_VRING_BASE).
> =

> They are based on the tests sent back them, the ones that were not
> included (reasons in that thread). This series changes:
> =

> * Delete need to export the ugly function in virtio_ring, now all the
> code is added in tools/virtio (except the one line fix).
> * Add forgotten uses of vhost_vq_set_backend. Fix bad usage order in
> vhost_test_set_backend.
> * Drop random reset, not really needed.
> * Minor changes updating tests code.
> =

> This serie is meant to be applied on top of
> 5de4e0b7068337cf0d4ca48a4011746410115aae in
> git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git.

Is this still needed? The patches lack Signed-off-by and
commit log descriptions, reference commit Ids without subject.
See Documentation/process/submitting-patches.rst

> Eugenio P=C3=A9rez (8):
>   tools/virtio: fix virtio_test.c indentation
>   vhost: Not cleaning batched descs in VHOST_SET_VRING_BASE ioctl
>   vhost: Replace vq->private_data access by backend accesors
>   vhost: Fix bad order in vhost_test_set_backend at enable
>   tools/virtio: Use __vring_new_virtqueue in virtio_test.c
>   tools/virtio: Extract virtqueue initialization in vq_reset
>   tools/virtio: Reset index in virtio_test --reset.
>   tools/virtio: Use tools/include/list.h instead of stubs
> =

>  drivers/vhost/test.c        |  8 ++---
>  drivers/vhost/vhost.c       |  1 -
>  tools/virtio/linux/kernel.h |  7 +----
>  tools/virtio/linux/virtio.h |  5 ++--
>  tools/virtio/virtio_test.c  | 58 +++++++++++++++++++++++++++----------
>  tools/virtio/vringh_test.c  |  2 ++
>  6 files changed, 51 insertions(+), 30 deletions(-)
> =

> -- =

> 2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
