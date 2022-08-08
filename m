Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FF958C8B5
	for <lists.virtualization@lfdr.de>; Mon,  8 Aug 2022 14:54:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEDE440A04;
	Mon,  8 Aug 2022 12:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEDE440A04
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=A6IyIml1;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=n16QRsxN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9vAXt62Quzf; Mon,  8 Aug 2022 12:54:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 879CA40A07;
	Mon,  8 Aug 2022 12:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 879CA40A07
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6F32C007C;
	Mon,  8 Aug 2022 12:54:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47DBAC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5C2140189
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5C2140189
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=A6IyIml1; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=n16QRsxN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4XaDFe0-1dF
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1091E4032E
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1091E4032E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E593A37ACE;
 Mon,  8 Aug 2022 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659963248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=au1PbrBym0RDvBK59gzpYLmZ5lBCOOF2TJfnVZ03KeI=;
 b=A6IyIml1ehWWPn5/77sPeEDw/XDPl4/2QiX94X+YCc1eMqCNB9IsAnb2eay6OMK2YBYbs4
 ZWr11e40xwZXCDE864iRl/8ZbWuYQdfqq/9xdlp5eOgHmK1BJ47vcaea/JG/CpI4RubcMa
 PJP9w/+8BNuXur2857Y6d5PLTql2jWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659963248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=au1PbrBym0RDvBK59gzpYLmZ5lBCOOF2TJfnVZ03KeI=;
 b=n16QRsxNOLQ1lSZJxtOxmQYqXgZ8dOOAmjeuemCUbTMQC5fhaAyIQnY9+Z18BcgpBNWtOr
 VUTtPZronTGC+ICg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 914C413ADE;
 Mon,  8 Aug 2022 12:54:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kCdiInAH8WLHUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Aug 2022 12:54:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
Subject: [PATCH v2 01/14] iosys-map: Add IOSYS_MAP_INIT_VADDR_IOMEM()
Date: Mon,  8 Aug 2022 14:53:53 +0200
Message-Id: <20220808125406.20752-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808125406.20752-1-tzimmermann@suse.de>
References: <20220808125406.20752-1-tzimmermann@suse.de>
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

Add IOSYS_MAP_INIT_VADDR_IOMEM() for static init of variables of type
struct iosys_map.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/iosys-map.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index a533cae189d7..cb71aa616bd3 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -46,10 +46,13 @@
  *
  *	iosys_map_set_vaddr(&map, 0xdeadbeaf);
  *
- * To set an address in I/O memory, use iosys_map_set_vaddr_iomem().
+ * To set an address in I/O memory, use IOSYS_MAP_INIT_VADDR_IOMEM() or
+ * iosys_map_set_vaddr_iomem().
  *
  * .. code-block:: c
  *
+ *	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(0xdeadbeaf);
+ *
  *	iosys_map_set_vaddr_iomem(&map, 0xdeadbeaf);
  *
  * Instances of struct iosys_map do not have to be cleaned up, but
@@ -121,6 +124,16 @@ struct iosys_map {
 		.is_iomem = false,	\
 	}
 
+/**
+ * IOSYS_MAP_INIT_VADDR_IOMEM - Initializes struct iosys_map to an address in I/O memory
+ * @vaddr_iomem_:	An I/O-memory address
+ */
+#define IOSYS_MAP_INIT_VADDR_IOMEM(vaddr_iomem_)	\
+	{						\
+		.vaddr_iomem = (vaddr_iomem_),		\
+		.is_iomem = true,			\
+	}
+
 /**
  * IOSYS_MAP_INIT_OFFSET - Initializes struct iosys_map from another iosys_map
  * @map_:	The dma-buf mapping structure to copy from
-- 
2.37.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
