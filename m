Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C15A6F27
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 18:32:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BF025D49;
	Tue,  3 Sep 2019 16:32:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6E6F29D
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 16:32:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 244AA712
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 16:32:12 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F155E2343A;
	Tue,  3 Sep 2019 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567528332;
	bh=WG6uoZmxjfAMieB1hpPCkzQG0SYx+aPlTDuHzoGfSrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wFYVmPzOyQlXoAIe6NC0ZRfHzRXIYqZ7OMl666m40GM/YNLqY1AP4fd1LbRjjtiM+
	eGJpduduePWnyNwKH70EngrkA5d5VjUMdWVbwZgpmb24B1+wtNG/sVdctENmdQFzPn
	kIgPZHsdYBa0EZEjVt2P2XbNkEVlI2hs6NUrWiwE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 162/167] virtio/s390: fix race on airq_areas[]
Date: Tue,  3 Sep 2019 12:25:14 -0400
Message-Id: <20190903162519.7136-162-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Halil Pasic <pasic@linux.ibm.com>, Marc Hartmayer <mhartmay@linux.ibm.com>
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

From: Halil Pasic <pasic@linux.ibm.com>

[ Upstream commit 4f419eb14272e0698e8c55bb5f3f266cc2a21c81 ]

The access to airq_areas was racy ever since the adapter interrupts got
introduced to virtio-ccw, but since commit 39c7dcb15892 ("virtio/s390:
make airq summary indicators DMA") this became an issue in practice as
well. Namely before that commit the airq_info that got overwritten was
still functional. After that commit however the two infos share a
summary_indicator, which aggravates the situation. Which means
auto-online mechanism occasionally hangs the boot with virtio_blk.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Cc: stable@vger.kernel.org
Fixes: 96b14536d935 ("virtio-ccw: virtio-ccw adapter interrupt support.")
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/s390/virtio/virtio_ccw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index ec54538f7ae1c..67efdf25657f3 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -132,6 +132,7 @@ struct airq_info {
 	struct airq_iv *aiv;
 };
 static struct airq_info *airq_areas[MAX_AIRQ_AREAS];
+static DEFINE_MUTEX(airq_areas_lock);
 
 #define CCW_CMD_SET_VQ 0x13
 #define CCW_CMD_VDEV_RESET 0x33
@@ -244,9 +245,11 @@ static unsigned long get_airq_indicator(struct virtqueue *vqs[], int nvqs,
 	unsigned long bit, flags;
 
 	for (i = 0; i < MAX_AIRQ_AREAS && !indicator_addr; i++) {
+		mutex_lock(&airq_areas_lock);
 		if (!airq_areas[i])
 			airq_areas[i] = new_airq_info();
 		info = airq_areas[i];
+		mutex_unlock(&airq_areas_lock);
 		if (!info)
 			return 0;
 		write_lock_irqsave(&info->lock, flags);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
