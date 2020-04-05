Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843119EDE9
	for <lists.virtualization@lfdr.de>; Sun,  5 Apr 2020 22:20:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0216486D82;
	Sun,  5 Apr 2020 20:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7X6LpQZziwpQ; Sun,  5 Apr 2020 20:20:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E724386D81;
	Sun,  5 Apr 2020 20:20:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE2F4C0177;
	Sun,  5 Apr 2020 20:20:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BAA4C0177
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Apr 2020 20:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 75A8E86D13
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Apr 2020 20:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKt3SuX7w2rl
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Apr 2020 20:20:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0B8A486D08
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Apr 2020 20:20:53 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id de14so16414934edb.4
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Apr 2020 13:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZecswmQzcKyJcaA1KVr1PgDOFuDkBa9m5xQm0CMlRfg=;
 b=jJyCDymm6a4Y4wyhQ19mQrdIHDOuRafStVA1S1Ig6u2VsstNNG+WN5ithcMu/UoDhe
 CJm6CNrO5du/C461KF08IoNM6ixV+wdPZH8150mM/yVeqUBK51IxAnWz7mKOY839n8aW
 d7cHEB5htx7FQ8+DMQOGIPAUPdAP2iIaT8fdrFL0ztPZz0GCoILB7X3WnENer2eAJskQ
 eeo1VWbmuMKB2MUvYRbouX1S5SlVWKrKQ6M6xDtskZYZDXj9EBjSi5jMaCUjXzgkBOze
 jU3zjVkxzmHp8gl2mo4gFFASzkAJPg2bF21TLTOydSfR8DchzsZcVw7KD93PqUSsu39Y
 78tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZecswmQzcKyJcaA1KVr1PgDOFuDkBa9m5xQm0CMlRfg=;
 b=igsSKgXL8QtSC4RNsnubyRFf86s1QHOwuRiP9fnVWSQj0Aa17QpIiPygtM+KdNyqUg
 lo9ZobVrNxTeHAJv2plbGWOVFkPWEcFImFxckdwk8qBUnEXqcGtW0i7SqRopnf9vEFFw
 F80II/duZZJh1BHjPkUoW27wGJwYA83YzgfbIITy+wX9aVd/6L1pbNRxf2Ug3Td2CSJJ
 ffTeC3cUnx2PvlbKNE+MD6r4MeKymX4hHUXlI07UP8GJ4aB15z63A2vJsXpUrbOsBtyA
 IVkL+DA8nm0ZtTs+gIFVKdPSqw1dt8+1RQUfzfBbqCKYQ3MhOxqFNdlT9LXrXJr5s1Hq
 9aRw==
X-Gm-Message-State: AGi0Pub6RxFEDthFrshabElw5jckRSTcrWTAaJVFif/D+kwAUAjGDb24
 1aMtNEG4J8BPEJS/O2yhepg50RZjuGr7CQ==
X-Google-Smtp-Source: APiQypIEsOpmUVRbUVIGQF9PTFmAXeRwenTbMDANUZ4VQGITx+F9m6bijBqeMQEHZ9PikkiF90Ex9A==
X-Received: by 2002:ac2:4143:: with SMTP id c3mr4585061lfi.131.1586117602906; 
 Sun, 05 Apr 2020 13:13:22 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id m1sm5450815lfl.69.2020.04.05.13.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 13:13:22 -0700 (PDT)
From: andrew@daynix.com
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] Fix: buffer overflow during hvc_alloc().
Date: Sun,  5 Apr 2020 23:40:24 +0300
Message-Id: <20200405204024.1007843-1-andrew@daynix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, jslaby@suse.com
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

From: Andrew Melnychenko <andrew@daynix.com>

If there is a lot(more then 16) of virtio-console devices
or virtio_console module is reloaded
- buffers 'vtermnos' and 'cons_ops' are overflowed.
In older kernels it overruns spinlock which leads to kernel freezing:
https://bugzilla.redhat.com/show_bug.cgi?id=1786239

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 drivers/tty/hvc/hvc_console.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 27284a2dcd2b..436cc51c92c3 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -302,10 +302,6 @@ int hvc_instantiate(uint32_t vtermno, int index, const struct hv_ops *ops)
 	vtermnos[index] = vtermno;
 	cons_ops[index] = ops;
 
-	/* reserve all indices up to and including this index */
-	if (last_hvc < index)
-		last_hvc = index;
-
 	/* check if we need to re-register the kernel console */
 	hvc_check_console(index);
 
@@ -960,13 +956,22 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 		    cons_ops[i] == hp->ops)
 			break;
 
-	/* no matching slot, just use a counter */
-	if (i >= MAX_NR_HVC_CONSOLES)
-		i = ++last_hvc;
+	if (i >= MAX_NR_HVC_CONSOLES) {
+
+		/* find 'empty' slot for console */
+		for (i = 0; i < MAX_NR_HVC_CONSOLES && vtermnos[i] != -1; i++) {
+		}
+
+		/* no matching slot, just use a counter */
+		if (i == MAX_NR_HVC_CONSOLES)
+			i = ++last_hvc + MAX_NR_HVC_CONSOLES;
+	}
 
 	hp->index = i;
-	cons_ops[i] = ops;
-	vtermnos[i] = vtermno;
+	if (i < MAX_NR_HVC_CONSOLES) {
+		cons_ops[i] = ops;
+		vtermnos[i] = vtermno;
+	}
 
 	list_add_tail(&(hp->next), &hvc_structs);
 	mutex_unlock(&hvc_structs_mutex);
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
