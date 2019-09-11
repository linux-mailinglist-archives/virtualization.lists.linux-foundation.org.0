Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 719C2B036A
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 20:14:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4DE91E8D;
	Wed, 11 Sep 2019 18:14:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B490DE3C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 18:14:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6D97881A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 18:14:10 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x15so11922469pgg.8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 11:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QeCkq8O6sVKFyd/945VFVyHWjibGiHNZAw/pssnAllE=;
	b=I0SjecpohOXAuX41i+C8/iUqI2Ta/6iJL/5++KgCgax3VgHtodgZSCGi7o9EreJyrD
	XN0LgK6zJ5+788K+EAIjt5svypU/Lzsd2QUfTjt+P+eZTKhp+EFx4sOxnOi/RLxhKSNl
	kPHqBgZR/n6Pnn3u/zAydjw5VQM4t4SSuZetI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QeCkq8O6sVKFyd/945VFVyHWjibGiHNZAw/pssnAllE=;
	b=AGQlAzcvfT7Tu/iHy2hvkeHOOlwvDil3oYUqZLELEFU1g6QkpfETpIHmGq5TC/sruY
	b3R3K6kTXRBayDtDajXl6wPp7x9eZkb4Y5j/A8fIv8igu/NyjvOxarKCZOui2wayAr1W
	xOMeZe1mRT9IINe/MADR1hjg4dOv4mq78E7X3sueTaGNF66TwnMobNfpJ9skTP70j49o
	xmKeXZyoT1iRCFPKX+UD2fArccyO20vnhx6s9ESKoosC4C3815uu8OPVt/Itw6p5nxrm
	g0bK7CxzHKOxAvfM+l7dxALLWBXssVW3hjxY038j6NgDP4ig7fp51nmYjm5/TIo0alt7
	h3mw==
X-Gm-Message-State: APjAAAVz1CIXO7+7JwkCSQAwUKkE61kEtOk0Hu6pmTsGaegFWCMN3KUo
	JM8BeMd6VfxytHpO70WUb3EezA==
X-Google-Smtp-Source: APXvYqw2YMboZHNEz3lO+hmTQMf8RZ0yNwApdiKl8X00zTdruij3p8IG09Q5F3leuHLIUyGCjDM6/A==
X-Received: by 2002:a62:1c16:: with SMTP id c22mr45606019pfc.10.1568225650053; 
	Wed, 11 Sep 2019 11:14:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id
	a13sm31056059pfg.10.2019.09.11.11.14.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Sep 2019 11:14:08 -0700 (PDT)
From: David Riley <davidriley@chromium.org>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v4 0/2] drm/virtio: Use vmalloc for command buffer
	alllocations.
Date: Wed, 11 Sep 2019 11:14:01 -0700
Message-Id: <20190911181403.40909-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190829212417.257397-1-davidriley@chromium.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Userspace requested command buffer allocations could be too large
to make as a contiguous allocation.  Use vmalloc if necessary to
satisfy those allocations.

v1: Initial version.
v2: Properly account for number of free descriptors required.
v3: Remove offset handling for vmalloc'd buffers.
v4: Rebase onto drm-misc-next.

David Riley (2):
  drm/virtio: Rewrite virtio_gpu_queue_ctrl_buffer using fenced version.
  drm/virtio: Use vmalloc for command buffer allocations.

 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  4 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 98 ++++++++++++++++++++------
 2 files changed, 79 insertions(+), 23 deletions(-)

-- 
2.23.0.162.g0b9fbb3734-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
