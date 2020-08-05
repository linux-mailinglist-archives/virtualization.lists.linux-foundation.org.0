Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A58023CB1A
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:43:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 55B4986C18;
	Wed,  5 Aug 2020 13:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYOwNoDbKw9c; Wed,  5 Aug 2020 13:43:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D977F86DC5;
	Wed,  5 Aug 2020 13:43:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCA7DC004C;
	Wed,  5 Aug 2020 13:43:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCBABC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AB901880B3
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjI9YE1ApzRr
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 046A388137
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yjMsup4mt600oOWRixyKMEsWQPnME+FeaUdLXa+RES4=;
 b=V4eLQi5VUQb0m8j2AIeBVMMj/XrfAwX+GRCnpgKlAe1cDEvpMqB2nATlL7wBSzqnqDExKK
 XVJbj0sA+geAW+1MY2ZM0pcTbX214wLcq/TCnSYSKEZCwS0Jje9hbXe+EzcuXXRGi8LIk0
 SIM1BtSVDQFWIW1xxKmM0+qko/eoJ24=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-1sdLNC_1NzisEI8CMLm5fg-1; Wed, 05 Aug 2020 09:43:32 -0400
X-MC-Unique: 1sdLNC_1NzisEI8CMLm5fg-1
Received: by mail-wr1-f71.google.com with SMTP id f14so13525027wrm.22
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yjMsup4mt600oOWRixyKMEsWQPnME+FeaUdLXa+RES4=;
 b=sZSC5/X7iHdh9XMJ/wWMSnIzmuDwxjrBcX6HDPKEBL0qae5owNXYgkZ+nLw6osPBHY
 S4XZamL9kqZ4DhgCwC63tkH7T/WbqIc8Qe4AauM0N8gUiFs1BTauWs2Q5Af3oS4m7C+F
 mYge6iw5ihkaLo0EiWxVzueFtFqSWcgkFlWsU0TvCpZlF9OKC4fs7yGZtrHa7swDGGrZ
 FMyL/VHdhPaZBdMJZARr7yw/gEHwCgXHPAWWe9/uA1xIDH2Mmew0WF9pVVBhY7THfAjB
 BbCvf9rA1gwpSE87dD1B5R7Ngm/v9zrekBsF/a9W3mD9OrhOu1gBjWJLAl38d60lM4dB
 Wueg==
X-Gm-Message-State: AOAM532m4k5gpypsF+j/FzR4lN88nhQhTjlZh+sZkPQf8kShtVGSvQF5
 HewYVR76IQaPqXItFcsph40b5StEWcUQRgHwuwZCkNf9TqnvXtgHf1OhZ5fOrqVSPlsRoYwlO4n
 v4X7yxAEP9vIyqehmVdUGcAGgbYC6Xb82U5BLyNQS6w==
X-Received: by 2002:a1c:1f12:: with SMTP id f18mr3583776wmf.66.1596635010684; 
 Wed, 05 Aug 2020 06:43:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+IkYFmgt6a8D6EfEP79DtxSQX6aDSV9q0nXGklsXwBwYON7OYUJgmN08O2YIZlhsvYQ8Cdg==
X-Received: by 2002:a1c:1f12:: with SMTP id f18mr3583770wmf.66.1596635010521; 
 Wed, 05 Aug 2020 06:43:30 -0700 (PDT)
Received: from redhat.com (bzq-79-180-0-181.red.bezeqint.net. [79.180.0.181])
 by smtp.gmail.com with ESMTPSA id
 b77sm2352377wmb.3.2020.08.05.06.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:43:29 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:43:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/38] virtio_balloon: correct tags for config space fields
Message-ID: <20200805134226.1106164-6-mst@redhat.com>
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 virtualization@lists.linux-foundation.org
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

Tag config space fields as having little endian-ness.
Note that balloon is special: LE even when using
the legacy interface.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 include/uapi/linux/virtio_balloon.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/uapi/linux/virtio_balloon.h b/include/uapi/linux/virtio_balloon.h
index dc3e656470dd..ddaa45e723c4 100644
--- a/include/uapi/linux/virtio_balloon.h
+++ b/include/uapi/linux/virtio_balloon.h
@@ -45,20 +45,20 @@
 #define VIRTIO_BALLOON_CMD_ID_DONE	1
 struct virtio_balloon_config {
 	/* Number of pages host wants Guest to give up. */
-	__u32 num_pages;
+	__le32 num_pages;
 	/* Number of pages we've actually got in balloon. */
-	__u32 actual;
+	__le32 actual;
 	/*
 	 * Free page hint command id, readonly by guest.
 	 * Was previously named free_page_report_cmd_id so we
 	 * need to carry that name for legacy support.
 	 */
 	union {
-		__u32 free_page_hint_cmd_id;
-		__u32 free_page_report_cmd_id;	/* deprecated */
+		__le32 free_page_hint_cmd_id;
+		__le32 free_page_report_cmd_id;	/* deprecated */
 	};
 	/* Stores PAGE_POISON if page poisoning is in use */
-	__u32 poison_val;
+	__le32 poison_val;
 };
 
 #define VIRTIO_BALLOON_S_SWAP_IN  0   /* Amount of memory swapped in */
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
