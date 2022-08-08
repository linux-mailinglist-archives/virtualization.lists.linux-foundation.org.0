Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF158C8AB
	for <lists.virtualization@lfdr.de>; Mon,  8 Aug 2022 14:54:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11FDF8239A;
	Mon,  8 Aug 2022 12:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11FDF8239A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=X890syQv;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NQjPenJ8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycqT0Lqtx91X; Mon,  8 Aug 2022 12:54:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A091281A23;
	Mon,  8 Aug 2022 12:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A091281A23
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7E1AC007C;
	Mon,  8 Aug 2022 12:54:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 352E1C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F24F405AA
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F24F405AA
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=X890syQv; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NQjPenJ8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-DiC2xOpUgK
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED77040189
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED77040189
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C5BE34C95;
 Mon,  8 Aug 2022 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659963248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ik09SnqexUD06uakj2NLVtxYzVE0gpz9sZNZeW15+mk=;
 b=X890syQvd+elb+aB4Mr/Wy4ux2Gc5pEj4+8e78pbY6R6WPDfOWgxS5XvBe/FOSQWuk5Ezs
 HLNdUBtkzYrWkRQnbC9eJW0nRfJHir8hLIAU1AbIoXN+r13sECMAJGwDrtMLSfbPc3Ou9L
 srzrDYEIZakjdnBCyX+h9suS+3gcOSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659963248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ik09SnqexUD06uakj2NLVtxYzVE0gpz9sZNZeW15+mk=;
 b=NQjPenJ8n0RiAhloW7VTeGOf1DlRN9/CKs6NAXVq5DZRUrRR3cMNZijvwru4np0Xj3PdUZ
 53/CUv7O36zCNrCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 354EF13A7C;
 Mon,  8 Aug 2022 12:54:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JrTxC3AH8WLHUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Aug 2022 12:54:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
Subject: [PATCH v2 00/14] drm/format-helper: Move to struct iosys_map
Date: Mon,  8 Aug 2022 14:53:52 +0200
Message-Id: <20220808125406.20752-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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

Change format-conversion helpers to use struct iosys_map for source
and destination buffers. Update all users. Also prepare interface for
multi-plane color formats.

The format-conversion helpers mostly used to convert to I/O memory
or system memory. To actual memory type depended on the usecase. We
now have drivers upcomming that do the conversion entirely in system
memory. It's a good opportunity to stream-line the interface of the
conversion helpers to use struct iosys_map. Source and destination
buffers can now be either in system or in I/O memory. Note that the
implementation still only supports source buffers in system memory.

This patchset also changes the interface to support multi-plane
color formats, where the values for each component are stored in
distinct memory locations. Converting from RGBRGBRGB to RRRGGGBBB
would require a single source buffer with RGB values and 3 destination
buffers for the R, G and B values. Conversion-helper interfaces now
support this.

v2:
	* add IOSYS_MAP_INIT_VADDR_IOMEM (Sam)
	* use drm_format_info_bpp() (Sam)
	* update documentation (Sam)
	* rename 'vmap' to 'src' (Sam)
	* many smaller cleanups and fixes (Sam, Jose)

Thomas Zimmermann (14):
  iosys-map: Add IOSYS_MAP_INIT_VADDR_IOMEM()
  drm/format-helper: Provide drm_fb_blit()
  drm/format-helper: Merge drm_fb_memcpy() and drm_fb_memcpy_toio()
  drm/format-helper: Convert drm_fb_swab() to struct iosys_map
  drm/format-helper: Rework XRGB8888-to-RGBG332 conversion
  drm/format-helper: Rework XRGB8888-to-RGBG565 conversion
  drm/format-helper: Rework XRGB8888-to-RGB888 conversion
  drm/format-helper: Rework RGB565-to-XRGB8888 conversion
  drm/format-helper: Rework RGB888-to-XRGB8888 conversion
  drm/format-helper: Rework XRGB8888-to-XRGB2101010 conversion
  drm/format-helper: Rework XRGB8888-to-GRAY8 conversion
  drm/format-helper: Rework XRGB8888-to-MONO conversion
  drm/format-helper: Move destination-buffer handling into internal
    helper
  drm/format-helper: Rename parameter vmap to src

 drivers/gpu/drm/drm_format_helper.c           | 509 ++++++++++--------
 drivers/gpu/drm/drm_mipi_dbi.c                |   9 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  20 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   9 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c        |   9 +-
 drivers/gpu/drm/solomon/ssd130x.c             |   7 +-
 .../gpu/drm/tests/drm_format_helper_test.c    |  45 +-
 drivers/gpu/drm/tiny/cirrus.c                 |  19 +-
 drivers/gpu/drm/tiny/repaper.c                |   6 +-
 drivers/gpu/drm/tiny/simpledrm.c              |   8 +-
 drivers/gpu/drm/tiny/st7586.c                 |   5 +-
 include/drm/drm_format_helper.h               |  56 +-
 include/linux/iosys-map.h                     |  15 +-
 13 files changed, 416 insertions(+), 301 deletions(-)


base-commit: 2bdae66c9988dd0f07633629c0a85383cfc05940
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
-- 
2.37.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
