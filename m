Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ADA20970E
	for <lists.virtualization@lfdr.de>; Thu, 25 Jun 2020 01:21:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 94D6F88386;
	Wed, 24 Jun 2020 23:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80QmRZnjDb2P; Wed, 24 Jun 2020 23:21:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 768F18838E;
	Wed, 24 Jun 2020 23:21:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56FA5C0894;
	Wed, 24 Jun 2020 23:21:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56300C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 23:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 49C9488388
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 23:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rlf+F9Zr7moR
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 23:21:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E0D5788386
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 23:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593040884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=HVbEuEGkVIuG5NhNxqmnGS+9NKLEk9a8dY03A8fYLyw=;
 b=QvE8GkRTfZMdmrdAMrMgjbXA7gP2YqsHB2zgWjYszi3jk2e1q4dlTH/xrRqhq8yboekufG
 8ltY3FX8SohPn234Qm7C5UcqZbeezri1spg/SeXPxw+18Iz7hZOtpEWIuCrT+eu1abaUkw
 /592iYkL+rezMxBWu0f2iN8lKYqfhI4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-2adT8XUcOeaN1eSm7zFz5w-1; Wed, 24 Jun 2020 19:21:22 -0400
X-MC-Unique: 2adT8XUcOeaN1eSm7zFz5w-1
Received: by mail-wm1-f71.google.com with SMTP id v6so2615337wmg.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 16:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=HVbEuEGkVIuG5NhNxqmnGS+9NKLEk9a8dY03A8fYLyw=;
 b=N1/trrnguNBZgjIn9PorEtmOATG1TRK2ncdQyt5YedNxHcwMCosdemMZi4ky+vbJiQ
 YV15F6nwA6ztt59xrDASFS8Cg7ZP1dePO5XUOfENmY06R9pinJrBMIx1VIiuOxN9YNoH
 gVIgUwO8iUemMwM7UNUV6gcG1bKqi2NE09MGmu/6xu2UcZDWRYZv64ayTZPN5GKe50Dd
 cj/UADLIc1SPtYp/kNwBa/vzBnhxyKQCbU2Q4utjJwyOQxj08gAcFPfqE/II1H9v3iVv
 mJuARRch0cpcQBACJYvutblWTr7HnNHWqukSfYypXqJhNgvg7xCHTECPj6yt2b0n2ITE
 o8Cg==
X-Gm-Message-State: AOAM533kJ+r088Q8a5gFiOviKMvlABRbYy57x1kJnreLs+er7jXqA6ux
 18dyHj7zkXrh4D2xt/xTyCGGQsSDT5Tj/CsrrtpLhwTiwdck36BZxNd43uMogby/4t5RSVJ6y+Y
 yL+vVzxxHGP5VsojTpz2CKp5cedlwxc2w8GrJLrdgvQ==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr167747wmc.126.1593040881218;
 Wed, 24 Jun 2020 16:21:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM0cktsDl5CrWaaOPv+1nYAYm4w3v8Sv0284TWIxv5uQ05SVVcH6miZb9gN0YuAb6dFYTBHA==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr167730wmc.126.1593040881042;
 Wed, 24 Jun 2020 16:21:21 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 c25sm9717109wml.46.2020.06.24.16.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 16:21:20 -0700 (PDT)
Date: Wed, 24 Jun 2020 19:21:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] virtio: modernize DMA quirks
Message-ID: <20200624232035.704217-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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

Use generic names for the quirks to make it clear it is not just about
the IOMMU, it's about DMA access in general.

changes from v1:
	added patch 2

Michael S. Tsirkin (2):
  virtio: VIRTIO_F_IOMMU_PLATFORM -> VIRTIO_F_ACCESS_PLATFORM
  virtio: virtio_has_iommu_quirk -> virtio_has_dma_quirk

 arch/um/drivers/virtio_uml.c            |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  4 ++--
 drivers/vdpa/ifcvf/ifcvf_base.h         |  2 +-
 drivers/vdpa/vdpa_sim/vdpa_sim.c        |  4 ++--
 drivers/vhost/net.c                     |  4 ++--
 drivers/vhost/vdpa.c                    |  2 +-
 drivers/virtio/virtio_balloon.c         |  2 +-
 drivers/virtio/virtio_ring.c            |  4 ++--
 include/linux/virtio_config.h           |  6 +++---
 include/uapi/linux/virtio_config.h      | 10 +++++++---
 tools/virtio/linux/virtio_config.h      |  6 +++---
 12 files changed, 26 insertions(+), 22 deletions(-)

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
