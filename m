Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444D32A6DC
	for <lists.virtualization@lfdr.de>; Tue,  2 Mar 2021 18:03:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D1DD43183;
	Tue,  2 Mar 2021 17:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alnCzpr560we; Tue,  2 Mar 2021 17:03:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 695DB4316A;
	Tue,  2 Mar 2021 17:03:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04BADC000A;
	Tue,  2 Mar 2021 17:03:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DF89C000A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 17:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3237C6068C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 17:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=opensynergy.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1SuQ0wIllL1P
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 17:03:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 204356066B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 17:03:18 +0000 (UTC)
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 50D81A1795;
 Tue,  2 Mar 2021 17:47:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:message-id:mime-version:reply-to:subject:subject
 :to:to; s=srmailgate02; bh=zLw+m1V3ebGqwPplU0MNd1Q6qf9SUP0LCheI5
 4hJGqw=; b=crc0m3mF5l+xzAdw4ughtugJuFxkndprcj1LsZku4S0liiXo1LU1B
 lj7CAB4oxHmakYCoc3MLqwGXoBA25CPrytvPEIdRtnQxHh8L+SoaPWnRhEPPg8QB
 VAMWtVk52DTWnRhjL377bVXV5klYRcghtUA6GcD4MYowL242X7G0RXFrL5m+ghT2
 aX+E4hdP5rmNL/RvIqWUc4dvb++RYcw9oh+ZaygojgNjK7D+7EmlnKB0ZmfmZY5P
 nvNI/HSOP23fqk8rbXC1Db3h/F8jmh6yxhTKIsF/2aVa0dvoocT4Yl/YflE3jsNA
 tGj2GNcGuabJ55U3+cLb0yDsQQ62OQGFg==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v7 0/9] ALSA: add virtio sound driver
Date: Tue, 2 Mar 2021 17:47:00 +0100
Message-ID: <20210302164709.3142702-1-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

This series implements a driver part of the virtio sound device
specification v8 [1].

The driver supports PCM playback and capture substreams, jack and
channel map controls. A message-based transport is used to write/read
PCM frames to/from a device.

As a device part was used OpenSynergy proprietary implementation.

v7 changes:
 - Moved the snd_pcm_period_elapsed() call from the interrupt handler to the
   kernel worker for being consistent with the non-atomic mode of the PCM
   device.
 - Removed SNDRV_PCM_INFO_RESUME flag. Now ops->prepare() sets the parameters
   for the substream if it was previously suspended.
 - Some additional code readability improvements/comments.

[1] https://lists.oasis-open.org/archives/virtio-dev/202003/msg00185.html


Anton Yakovlev (9):
  uapi: virtio_ids: add a sound device type ID from OASIS spec
  ALSA: virtio: add virtio sound driver
  ALSA: virtio: handling control messages
  ALSA: virtio: build PCM devices and substream hardware descriptors
  ALSA: virtio: handling control and I/O messages for the PCM device
  ALSA: virtio: PCM substream operators
  ALSA: virtio: introduce jack support
  ALSA: virtio: introduce PCM channel map support
  ALSA: virtio: introduce device suspend/resume support

 MAINTAINERS                     |   9 +
 include/uapi/linux/virtio_ids.h |   1 +
 include/uapi/linux/virtio_snd.h | 334 +++++++++++++++++++++
 sound/Kconfig                   |   2 +
 sound/Makefile                  |   3 +-
 sound/virtio/Kconfig            |  10 +
 sound/virtio/Makefile           |  13 +
 sound/virtio/virtio_card.c      | 449 ++++++++++++++++++++++++++++
 sound/virtio/virtio_card.h      | 111 +++++++
 sound/virtio/virtio_chmap.c     | 219 ++++++++++++++
 sound/virtio/virtio_ctl_msg.c   | 310 +++++++++++++++++++
 sound/virtio/virtio_ctl_msg.h   |  78 +++++
 sound/virtio/virtio_jack.c      | 233 +++++++++++++++
 sound/virtio/virtio_pcm.c       | 513 ++++++++++++++++++++++++++++++++
 sound/virtio/virtio_pcm.h       | 124 ++++++++
 sound/virtio/virtio_pcm_msg.c   | 414 ++++++++++++++++++++++++++
 sound/virtio/virtio_pcm_ops.c   | 464 +++++++++++++++++++++++++++++
 17 files changed, 3286 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/linux/virtio_snd.h
 create mode 100644 sound/virtio/Kconfig
 create mode 100644 sound/virtio/Makefile
 create mode 100644 sound/virtio/virtio_card.c
 create mode 100644 sound/virtio/virtio_card.h
 create mode 100644 sound/virtio/virtio_chmap.c
 create mode 100644 sound/virtio/virtio_ctl_msg.c
 create mode 100644 sound/virtio/virtio_ctl_msg.h
 create mode 100644 sound/virtio/virtio_jack.c
 create mode 100644 sound/virtio/virtio_pcm.c
 create mode 100644 sound/virtio/virtio_pcm.h
 create mode 100644 sound/virtio/virtio_pcm_msg.c
 create mode 100644 sound/virtio/virtio_pcm_ops.c

-- 
2.30.1


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
