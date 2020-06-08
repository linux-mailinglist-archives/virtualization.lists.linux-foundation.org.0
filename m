Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F9A1F192B
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 14:53:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 047A18628E;
	Mon,  8 Jun 2020 12:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZgQza2XIAyg; Mon,  8 Jun 2020 12:53:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4FCC886DB2;
	Mon,  8 Jun 2020 12:53:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30C72C0894;
	Mon,  8 Jun 2020 12:53:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F391DC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D8E7D20462
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ERwsT8nEHf1B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:52:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 9291B1FEAE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591620776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=gjI/Xc/cqqYk/lSVknmdrxtI4JosdROOwhqNKTqv88I=;
 b=NN+up0NcCTUYLGSto74dqIaj288wsdjwMReMgxuG5xHIC6uKe+pm2l+F2uEzqtTaZGQPtx
 8lnBaH4juCamqVOBunK/5J1j5ZPFD3xsTFOF0kSH2fsYwn6exM3U6/OjdZxBNQNeCR+8mL
 KmeQZKvR/AF+SbMqgCMEEIv+6vXfP+s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-A6tX8VXLNB27STYTWLEZVA-1; Mon, 08 Jun 2020 08:52:54 -0400
X-MC-Unique: A6tX8VXLNB27STYTWLEZVA-1
Received: by mail-wr1-f69.google.com with SMTP id w4so7136700wrl.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 05:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=gjI/Xc/cqqYk/lSVknmdrxtI4JosdROOwhqNKTqv88I=;
 b=HJOMa32E86DGPqL0+LVRWC2fvq1NchiWco9ZsvOe19yWFxAl+OcyzfSZMmmwWXApUn
 ihgXMv/klsnHOTAHGDZxPDYQqagqyZycfsJE0XWmzHGX2N26Yn0meLPuIHU+UKXFUWbh
 KD46QZr90czsot7NiwNRF/YkG7oSmpy35CPn7J05IvGh+x4TJ0ys9N7k12TwcckrAnAi
 RI3b6ozm0BjgudxFAiAXIFQzqLusKdBUKwHyR93xqEAJW0AXxCFmz7KgNYplH6ES+lcR
 KNerH4jmUTlEf6iEqmzQUULFk2LU6iKp7pATub6ekDrAiaa/UGTnb+RdvJLwi6oWHrdd
 bl3g==
X-Gm-Message-State: AOAM531HzY15W43OnhDf5u7AAeXQReJv/W/NakOfWGVp6Ml4HnkJcylc
 y9tIjJLAYpeLFEvlu0V94jtz1aQbesUNsOQA3hjtzim5caGxqU3lfdBh/H+3qgpBPbyI59peTBA
 2+ZTZRLj9G6psYey+UdmN5EP98ec7wPfXbeyJY7jLkA==
X-Received: by 2002:a05:6000:1ce:: with SMTP id
 t14mr23504275wrx.300.1591620773839; 
 Mon, 08 Jun 2020 05:52:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDSI+/ZbdtAMbTo/u8TmLBd4nOMtF+iSAUbirR2p1aEeZspsKsHQ+oW3THKUaNWxC1PVL/dQ==
X-Received: by 2002:a05:6000:1ce:: with SMTP id
 t14mr23504259wrx.300.1591620773666; 
 Mon, 08 Jun 2020 05:52:53 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 y19sm21769323wmi.6.2020.06.08.05.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:52:52 -0700 (PDT)
Date: Mon, 8 Jun 2020 08:52:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v6 00/11] vhost: ring format independence
Message-ID: <20200608125238.728563-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, eperezma@redhat.com, kvm@vger.kernel.org,
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



This adds infrastructure required for supporting
multiple ring formats.

The idea is as follows: we convert descriptors to an
independent format first, and process that converting to
iov later.

Used ring is similar: we fetch into an independent struct first,
convert that to IOV later.

The point is that we have a tight loop that fetches
descriptors, which is good for cache utilization.
This will also allow all kind of batching tricks -
e.g. it seems possible to keep SMAP disabled while
we are fetching multiple descriptors.

For used descriptors, this allows keeping track of the buffer length
without need to rescan IOV.

This seems to perform exactly the same as the original
code based on a microbenchmark.
Lightly tested.
More testing would be very much appreciated.

changes from v5:
	- addressed comments by Jason: squashed API changes, fixed up discard

changes from v4:
	- added used descriptor format independence
	- addressed comments by jason
	- fixed a crash detected by the lkp robot.

changes from v3:
        - fixed error handling in case of indirect descriptors
        - add BUG_ON to detect buffer overflow in case of bugs
                in response to comment by Jason Wang
        - minor code tweaks

Changes from v2:
	- fixed indirect descriptor batching
                reported by Jason Wang

Changes from v1:
	- typo fixes


Michael S. Tsirkin (11):
  vhost: option to fetch descriptors through an independent struct
  vhost: use batched get_vq_desc version
  vhost/net: pass net specific struct pointer
  vhost: reorder functions
  vhost: format-independent API for used buffers
  vhost/net: convert to new API: heads->bufs
  vhost/net: avoid iov length math
  vhost/test: convert to the buf API
  vhost/scsi: switch to buf APIs
  vhost/vsock: switch to the buf API
  vhost: drop head based APIs

 drivers/vhost/net.c   | 174 ++++++++++---------
 drivers/vhost/scsi.c  |  73 ++++----
 drivers/vhost/test.c  |  22 +--
 drivers/vhost/vhost.c | 382 +++++++++++++++++++++++++++---------------
 drivers/vhost/vhost.h |  44 +++--
 drivers/vhost/vsock.c |  30 ++--
 6 files changed, 443 insertions(+), 282 deletions(-)

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
