Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E18360193
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 07:27:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74A4240204;
	Thu, 15 Apr 2021 05:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Li6C2UrU_dSV; Thu, 15 Apr 2021 05:27:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5A6640645;
	Thu, 15 Apr 2021 05:27:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7306FC000A;
	Thu, 15 Apr 2021 05:27:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FDF4C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 05:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F52A40F75
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 05:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7eDAH_pUvlM
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 05:27:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAD0640EAB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 05:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=FMTd8I8cM7ZBmOYcdPGq5q1CD9LHK5h6uuZ0K6Eod94=; b=gs7eGgnMpOvl7mf1Md8+Hgyu+u
 zr9W8DMqYp0bX7sUfA2mOC5r0JWxkLSSkGLLFzsELCUJrw/Sy5VCu402GbwsSVA1s+G6GqXw/l6MD
 bPXN+rM5fIz8fb9gYZm2mFSHXlJgZCDe27CCACKBAROSr3xUUrdRCKr0S/omkGV7gNFZ61YbksKfh
 g149DSC4YV4TUBEtZSEunvbW4/Dcu8k/DoIbVGQgeruIungJF7d+C9Kwff19mwKeh4IZWp5IYD+Wt
 /pKbSICrXfRHe4rtHeX0qynsueOPE3/yfVkKWCrCKrJj2G9ZBNaW3A0Qba7bp/BwD7XVhK9UaF0IO
 UnIN2Vxg==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWuWi-00Eu5H-3E; Thu, 15 Apr 2021 05:26:54 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] sound: virtio: correct the function name in kernel-doc comment
Date: Wed, 14 Apr 2021 22:26:45 -0700
Message-Id: <20210415052645.14465-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 virtualization@lists.linux-foundation.org,
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

Fix kernel-doc warning that the wrong function name is used in a
kernel-doc comment:

../sound/virtio/virtio_ctl_msg.c:70: warning: expecting prototype for virtsnd_ctl_msg_request(). Prototype was for virtsnd_ctl_msg_response() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: alsa-devel@alsa-project.org
---
 sound/virtio/virtio_ctl_msg.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210414.orig/sound/virtio/virtio_ctl_msg.c
+++ linux-next-20210414/sound/virtio/virtio_ctl_msg.c
@@ -61,7 +61,7 @@ void *virtsnd_ctl_msg_request(struct vir
 }
 
 /**
- * virtsnd_ctl_msg_request() - Get a pointer to the response header.
+ * virtsnd_ctl_msg_response() - Get a pointer to the response header.
  * @msg: Control message.
  *
  * Context: Any context.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
