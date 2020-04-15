Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D6F1AAFF7
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 19:44:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DF7A884332;
	Wed, 15 Apr 2020 17:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UjmoKrL887Pp; Wed, 15 Apr 2020 17:44:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 163D286018;
	Wed, 15 Apr 2020 17:44:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01649C0172;
	Wed, 15 Apr 2020 17:44:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B8A0C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 17:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 82BBF855EA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 17:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6v6bPh1-OrSd
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 17:44:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C5D0785551
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 17:44:16 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id b10so13965580qtt.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 10:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=cB+ZbCXcsLQVyy0UoHAdJNe2BIwwwLxFL/JeSAEpkoc=;
 b=lMwtRESb1RrDIFoLV21d4lg0qhrg8hjxZso7+gUTXtnvxRE9Nu6tP2MU9OZoh4tNN1
 Na4H1xROqNno4k29hA2LABNhkFrKTbh3aULiJiSrKZX44045FdI9HRg4YzCMR6Uy5DZ8
 6Y+VyMv8E4cp1p9QXmhAi1+/wfyEqUVXJsgJ0kwYud237xXLRb2p71KPupcLL+w6eLD2
 4PkYhzH4JOz6ondaenCKKoro8YxNJ3ip84GaAvI7jO5I1RNn5f+5Mrtgbc4hJkHwORLj
 p3nyvIwlHndzF2TMQdlxcuBUOlDvwHsUy378TF3o8DFRaWm2uD+TtooyyR5jIt5Ch8F0
 v/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=cB+ZbCXcsLQVyy0UoHAdJNe2BIwwwLxFL/JeSAEpkoc=;
 b=i0pVu7cB/RufN3CCHdS8tqazv33KnQKFXZBNa1JzEk3w2ENQ5fy+tVQC1QaXPwkgms
 vFg27+YnaFLQQ81Q/A0qM7BRue8Kg1r8jbMPsSfA87a8VkvPelik7bZAKVRXDCMuboOU
 TeI0Wo44NmIjCBXD1XLcBj1A6I/4JwG7DBhsGgDZ7DDZW3+/+hhUwxcNTaES0paUQqU8
 vp3ldeEOMjbDYtZY7ChQS7stMXj7TkoHtjiuMuVUKdT1JAg36EZ0XfFsOAj8lHcY2nXv
 frawGBE/NpD29dhvpmY3wdQq6xjOPrGy+4eqRKdj8Xc0IUXASPO2dxCq3WGeXFUG8znm
 sh6g==
X-Gm-Message-State: AGi0PuamSPx9DXTbRK5zJxlrAattQNlDLLE0Ba0/lG30iIfHZuCbePtW
 8SdxDa7CgBNdrSUozrouzxw=
X-Google-Smtp-Source: APiQypJ7sOhNyu2R9ON+f/EtFynLWmRPsfGLva79pUAoCMHX458mfDNW3m/pBpk/9UDjqpAVOiubWg==
X-Received: by 2002:ac8:3403:: with SMTP id u3mr22907591qtb.274.1586972655529; 
 Wed, 15 Apr 2020 10:44:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id d186sm2641313qkc.45.2020.04.15.10.44.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 10:44:15 -0700 (PDT)
Subject: [PATCH] virtio-balloon: Avoid using the word 'report' when
 referring to free page hinting
From: Alexander Duyck <alexander.duyck@gmail.com>
To: jasowang@redhat.com, david@redhat.com, mst@redhat.com
Date: Wed, 15 Apr 2020 10:44:08 -0700
Message-ID: <20200415174318.13597.99753.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org
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

From: Alexander Duyck <alexander.h.duyck@linux.intel.com>

It can be confusing to have multiple features within the same driver that
are using the same verbage. As such this patch is creating a union of
free_page_report_cmd_id with free_page_hint_cmd_id so that we can clean-up
the userspace code a bit in terms of readability while maintaining the
functionality of legacy code.

Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
---
 drivers/virtio/virtio_balloon.c     |    2 +-
 include/uapi/linux/virtio_balloon.h |   11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 0ef16566c3f3..95d9c2f0a7be 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -580,7 +580,7 @@ static u32 virtio_balloon_cmd_id_received(struct virtio_balloon *vb)
 	if (test_and_clear_bit(VIRTIO_BALLOON_CONFIG_READ_CMD_ID,
 			       &vb->config_read_bitmap))
 		virtio_cread(vb->vdev, struct virtio_balloon_config,
-			     free_page_report_cmd_id,
+			     free_page_hint_cmd_id,
 			     &vb->cmd_id_received_cache);
 
 	return vb->cmd_id_received_cache;
diff --git a/include/uapi/linux/virtio_balloon.h b/include/uapi/linux/virtio_balloon.h
index 19974392d324..dc3e656470dd 100644
--- a/include/uapi/linux/virtio_balloon.h
+++ b/include/uapi/linux/virtio_balloon.h
@@ -48,8 +48,15 @@ struct virtio_balloon_config {
 	__u32 num_pages;
 	/* Number of pages we've actually got in balloon. */
 	__u32 actual;
-	/* Free page report command id, readonly by guest */
-	__u32 free_page_report_cmd_id;
+	/*
+	 * Free page hint command id, readonly by guest.
+	 * Was previously named free_page_report_cmd_id so we
+	 * need to carry that name for legacy support.
+	 */
+	union {
+		__u32 free_page_hint_cmd_id;
+		__u32 free_page_report_cmd_id;	/* deprecated */
+	};
 	/* Stores PAGE_POISON if page poisoning is in use */
 	__u32 poison_val;
 };

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
