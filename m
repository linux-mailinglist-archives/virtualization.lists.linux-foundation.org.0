Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E585823CB19
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:43:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A258B84547;
	Wed,  5 Aug 2020 13:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeneW9zrMrvm; Wed,  5 Aug 2020 13:43:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA9D084481;
	Wed,  5 Aug 2020 13:43:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93522C004C;
	Wed,  5 Aug 2020 13:43:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 392DCC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 287F58757E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nL0A9H3Xlpqg
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6FF4387935
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rLyznuEr+YtS56JlIu4IevBHcH0S591inceyWkYffOs=;
 b=JKCNEcFPTKQChCIbUidxAHQnVAkowz1GUFgwyURJu14wHKH1NDMgtH5Q3itB9B5vBP2zan
 umMgzyVdJviPeMjwMT6R/gFd94s6NGi3HepMvhgvZ9YOTr1PCB7/UySQ8Ns4beW+vArnwF
 pFwFJNF8rtKPYdav5SAppx8XTjia+0U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-ZnviCMM4MT27X2gmy-6ZRg-1; Wed, 05 Aug 2020 09:43:29 -0400
X-MC-Unique: ZnviCMM4MT27X2gmy-6ZRg-1
Received: by mail-wr1-f69.google.com with SMTP id w7so11245586wre.11
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rLyznuEr+YtS56JlIu4IevBHcH0S591inceyWkYffOs=;
 b=Lz7sHSZ1NycVAi2w3kFeQR/osuMU40MEIjM59rji1tPOg6RUJEtauyJZiUk7aZtiLj
 +B6GzaKGjTeS82/tYt/uNvQfbQ6sCaocAPLATxeY4EnzxSZgkQExYiGMjgnRqTSrsrtM
 H7PL9BHxHPRGkgId4cn8CNUhTHK8NfbAtRZksAh6h/0+DbH4v8eIn/1JhuBRGLRk5TbA
 zAmALtQw8gI2oVi/746ZcO2ehpqGfONRt5XzCsjq3U7htEA6DXE5/moki8VafZXMnrJ2
 E4J/4gl0TYwaFZgvg6tagUrUW+acHW0J9JyF8t5tJdLCJDXyvcY9EVaGxxDCRD0Q1tmT
 qtIg==
X-Gm-Message-State: AOAM531Gdh1HeGDp1cUk7cVTL05D8Zy2LOKtZtFjSybQuda1V4DmxEKP
 pTD9ek1dz/nv+5LoWkOdqbG7+ztakP4BHKMnHbWe9VNGyzWqqLmN+D/KKldu18AFWKbddYagreu
 M6KNWejcjoIDP4VxXpvkeOgsFzUzGf/NDeitEWNmXMA==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr3278047wmc.162.1596635008084; 
 Wed, 05 Aug 2020 06:43:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2OznmEqQQuS3Gj15cuXvaM9QXX3f4/5FduhQJ7Ds5R+28pqvqB/Ctrz8niF5YwYSRgpWi9w==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr3278028wmc.162.1596635007890; 
 Wed, 05 Aug 2020 06:43:27 -0700 (PDT)
Received: from redhat.com (bzq-79-178-123-8.red.bezeqint.net. [79.178.123.8])
 by smtp.gmail.com with ESMTPSA id
 g25sm2752597wmh.35.2020.08.05.06.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:43:27 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:43:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/38] virtio_9p: correct tags for config space fields
Message-ID: <20200805134226.1106164-5-mst@redhat.com>
References: <20200805134226.1106164-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200805134226.1106164-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eric Van Hensbergen <ericvh@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 virtualization@lists.linux-foundation.org,
 v9fs-developer@lists.sourceforge.net
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

Tag config space fields as having virtio endian-ness.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 include/uapi/linux/virtio_9p.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/virtio_9p.h b/include/uapi/linux/virtio_9p.h
index 277c4ad44e84..441047432258 100644
--- a/include/uapi/linux/virtio_9p.h
+++ b/include/uapi/linux/virtio_9p.h
@@ -25,7 +25,7 @@
  * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  * SUCH DAMAGE. */
-#include <linux/types.h>
+#include <linux/virtio_types.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_config.h>
 
@@ -36,7 +36,7 @@
 
 struct virtio_9p_config {
 	/* length of the tag name */
-	__u16 tag_len;
+	__virtio16 tag_len;
 	/* non-NULL terminated tag name */
 	__u8 tag[0];
 } __attribute__((packed));
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
