Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B5D1A010C
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 00:26:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 658158742D;
	Mon,  6 Apr 2020 22:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMAizkzhqP4s; Mon,  6 Apr 2020 22:26:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3EC5D8704C;
	Mon,  6 Apr 2020 22:26:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19A61C0177;
	Mon,  6 Apr 2020 22:26:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87C79C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4441F232BD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUOa74t+oKNL
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 944CD2324B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586211996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=YfostCbdhwGwZGx9YP31YAbSToszXg/nrUIlp9m/uLJG2SgP43c01wVAwkz34XyJ5XnXfl
 f6nylLlGnnFYATxATnRh27YfzQqYhhsM3jgzaXrSKgcR7vqDBXJwaS/eez4D2mXsmIQtck
 aOcFcpZzOBreLN+l7FVI5HbGJOX4Meg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-2beDE3nWMp6REci5ubvO0g-1; Mon, 06 Apr 2020 18:26:32 -0400
X-MC-Unique: 2beDE3nWMp6REci5ubvO0g-1
Received: by mail-wr1-f70.google.com with SMTP id y6so631404wrq.21
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 15:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=d7k6MmqLJq96xOgAHXuiS7lMf5O+P49I5NdVjqdQeDS7r12c+znSEV+pPKWuPlWlPM
 JErBp5F7AOLJmBP0qXvcc7DyyTELMioZbBhpo6F/PmHRp4grBABoj0gp7OTZfI86jBNK
 KbOI/8m432dHtyrJd4j6VrAoipPnBeXcuhGhHTF2osdq8rO6e7kl/gOtrMf/zwDJr45s
 JNS5JkCEJ0shwNXsp+o+0X/SxJis9psMbLkdk+zah+kcn7frEvjE6FFpv3zR444CMKQS
 TmOK8ybuM9pkaIpQRyLvLvwWtMS20XnN9vcCeWv+1/ijoGkU32SGeDz1k5l/1wQxriSp
 FKJg==
X-Gm-Message-State: AGi0Pubcy3+f3r8QhZ1RSwk6rrptOXROXw6sRh/YETXqetHsteyqu+VS
 7A2x1qDAb2Rczxro225NDvD1PsBKuL28J6Eb67ChC6jkPrfPIPyHbdSJqwBX1/0q47LQSQKTnVC
 mhwPJGzqiEkeqeeje91Ay/7YgzD9noRgjULrkbm1tdw==
X-Received: by 2002:adf:fa4f:: with SMTP id y15mr1629333wrr.118.1586211991694; 
 Mon, 06 Apr 2020 15:26:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypID3vQSC8d+b7Qfd6yISzP96PUgOGeTuHuYX0knT/3rNQH8A57yKPUmPzAS5bhV68+Gd+1jBw==
X-Received: by 2002:adf:fa4f:: with SMTP id y15mr1629315wrr.118.1586211991504; 
 Mon, 06 Apr 2020 15:26:31 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id a80sm1183801wme.37.2020.04.06.15.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 15:26:31 -0700 (PDT)
Date: Mon, 6 Apr 2020 18:26:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/12] tools/virtio: define aligned attribute
Message-ID: <20200406222507.281867-2-mst@redhat.com>
References: <20200406222507.281867-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406222507.281867-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tools/virtio/linux/compiler.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtio/linux/compiler.h b/tools/virtio/linux/compiler.h
index 903dc9c4bd11..2c51bccb97bb 100644
--- a/tools/virtio/linux/compiler.h
+++ b/tools/virtio/linux/compiler.h
@@ -7,4 +7,5 @@
 
 #define READ_ONCE(var) (*((volatile typeof(var) *)(&(var))))
 
+#define __aligned(x) __attribute((__aligned__(x)))
 #endif
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
