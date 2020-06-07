Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B82CA1F0BA5
	for <lists.virtualization@lfdr.de>; Sun,  7 Jun 2020 16:11:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DE52620338;
	Sun,  7 Jun 2020 14:11:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLaCXVkMhVvl; Sun,  7 Jun 2020 14:11:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DED8B20336;
	Sun,  7 Jun 2020 14:11:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA6C8C016F;
	Sun,  7 Jun 2020 14:11:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DFF5C016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EEA2E85BCA
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I61qCuZ2Mo5u
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A405085168
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591539086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=OWdfFlhdvAuK9m65CuOfAgwGAWbw+S7EDp4ZxipnEDI=;
 b=McaMgNKEYodpEFWkgxnMNM7DdYEtfsPoFRTC7LqdtwcH5RUTNxp95K89hd5W6FVd3ai/Xa
 EKeIT1/XnqeN7ELZ7x0OF/n3jegH2NlFPb0qISGF8ql8o/AT99T16Ln4HTCXO9cbE3KeaX
 ivv0PHhhlh2ezpLfiSaSM20EnLS9znA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-S5KKPewqP4yGass91HIoyg-1; Sun, 07 Jun 2020 10:11:25 -0400
X-MC-Unique: S5KKPewqP4yGass91HIoyg-1
Received: by mail-wm1-f72.google.com with SMTP id r1so626809wmh.7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 07:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=OWdfFlhdvAuK9m65CuOfAgwGAWbw+S7EDp4ZxipnEDI=;
 b=uSvjX6aoPRn1+oZyOumQwHSeuTWTWgNmKJTCWfnDEdCGjgXOiHhd5VhFhVKznh7G73
 rJGkyJSBZCaHNusd5TlL/e0NuSoR00NCgWY3ONg8XyDhhvgaqRqhRj6txIunvbPW5sH7
 1Xa/D4kafKjxtV+iAj1/3joTjndLR9S5iQLD+625ITzsPv0WqrlT2wYDmyN5vOfYqaYD
 YUYqISpBJgPCjecwOCGEGWBbh83bjifIUMqPX61QLA4oUxoRpj30asnt7vkRLikex0Ye
 F2RikhfnybH3akTeEOLcLBJfzkdKGxPS68f+ZXcAthaa8p/N0qOx0dEZ8EIqYsBDgSbT
 /L2g==
X-Gm-Message-State: AOAM530oLUb/L8cL2pj9/V5RyYGvWQtKRNkzqS7fhd9JiBQXUogo/9II
 +kAJC20IYEnp3kcRA4P+oy/aQBJFEntfo2Vdi7f8ZWpHCv0oTUF1NfLXTPzKJ2AfNStTgnpF2mK
 dsjKFmKpFjT5smbYfM+7q5Veerk4oKk9rpiwM92c4iA==
X-Received: by 2002:a1c:6583:: with SMTP id
 z125mr12068652wmb.102.1591539083060; 
 Sun, 07 Jun 2020 07:11:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV7ZWEoPal74PMq+69HAL799WrVxakjuqYm1EYkHAsqG9CYVZ+7zhU5OuON8EQ3eWowy87cg==
X-Received: by 2002:a1c:6583:: with SMTP id
 z125mr12068635wmb.102.1591539082879; 
 Sun, 07 Jun 2020 07:11:22 -0700 (PDT)
Received: from redhat.com (bzq-82-81-31-23.red.bezeqint.net. [82.81.31.23])
 by smtp.gmail.com with ESMTPSA id u130sm20174752wmg.32.2020.06.07.07.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 07:11:22 -0700 (PDT)
Date: Sun, 7 Jun 2020 10:11:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v5 00/13] vhost: ring format independence
Message-ID: <20200607141057.704085-1-mst@redhat.com>
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


Michael S. Tsirkin (13):
  vhost: option to fetch descriptors through an independent struct
  vhost: use batched version by default
  vhost: batching fetches
  vhost: cleanup fetch_buf return code handling
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
 drivers/vhost/vhost.c | 380 +++++++++++++++++++++++++++---------------
 drivers/vhost/vhost.h |  44 +++--
 drivers/vhost/vsock.c |  30 ++--
 6 files changed, 441 insertions(+), 282 deletions(-)

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
