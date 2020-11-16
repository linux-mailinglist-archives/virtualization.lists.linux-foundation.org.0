Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F862B4483
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 14:14:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E7F308686C;
	Mon, 16 Nov 2020 13:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jsO2EG7Op4P; Mon, 16 Nov 2020 13:14:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5334386870;
	Mon, 16 Nov 2020 13:14:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CC42C07FF;
	Mon, 16 Nov 2020 13:14:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFFCCC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 13:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AE44085EBF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 13:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRHmABIy-cLi
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 13:14:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1EC0485E99
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 13:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605532473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=bcklXraRLL6YuQnGUW+mYhCFhDJ3s3DEvlUM79PK4ZQ=;
 b=GfU+pUnS38bLsTeEj7sCezW+xZ/DQrx/MXvSq5+zHilRMeGbhHvtTzmK9etlU+ZhfDQPdY
 RPRawCiFKXnM91T8bIhQnkieyp5UQUSzDPGz5XEXhbIyqVw53rEnq14orKPprhMYvVt5i+
 rGEBs8Gtq1T5s9NWo6blvunGKl5XcbY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-nxQxu_TzMSCJnfpu5svwRQ-1; Mon, 16 Nov 2020 08:14:31 -0500
X-MC-Unique: nxQxu_TzMSCJnfpu5svwRQ-1
Received: by mail-wr1-f70.google.com with SMTP id z7so9868239wrl.14
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 05:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=bcklXraRLL6YuQnGUW+mYhCFhDJ3s3DEvlUM79PK4ZQ=;
 b=iWOijRQhX+YTFQMzOBXojHqw7MUtxkzpMYMCqEIqtK8c/eTqSmTV9dF/N1UQefEpno
 Ph7J83A1V8I4pNOvdRrkVWRfKHRB5hHj+drUPUQ1CEVknDyhYKCmocQNcIFHJFEsPBnB
 ARjfdu67yoY9svSvX1L70B3l5wzCrsuIBcqzNHt4lQzLiXRoLuNHTUjUPiQLKcavo/H6
 dhlAySc0vTxTDJiWhMsK/BCg5f0mi7hbX7WCdSwq1Q48JFLNfO0bZO3+SIYwaqzWw4Sa
 TG1ydjKEob1rA7pvLTtUeCJSfLAKpWPx6itmUpxxZyGV8TIGOMn0yVclegRsBreXU7i+
 /r9A==
X-Gm-Message-State: AOAM530634N1dt4LSbo0W8+Tf80rpgnv8atRfJ8Ueo1+bBJ3/GFnPdmM
 Ek6wGvpKHz1EgfavAJ+vJIaTu/XrGalGbIj7vsvUsi4AalxhJizCqCKRuFTtofKrqZVHI5SsjZM
 NLeyQRlIdBf64gABRhcZRIzBQW8Em0C9NtmxvzVku2Q==
X-Received: by 2002:a1c:6002:: with SMTP id u2mr14508771wmb.29.1605532467576; 
 Mon, 16 Nov 2020 05:14:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoKOhCtfX4RQPxreiVjgYctq5k6WupqM3uofRLxRDRD1VbWHuNBhZz0uRXMRsQybcwkP1lsQ==
X-Received: by 2002:a1c:6002:: with SMTP id u2mr14508747wmb.29.1605532467415; 
 Mon, 16 Nov 2020 05:14:27 -0800 (PST)
Received: from redhat.com ([147.161.8.56])
 by smtp.gmail.com with ESMTPSA id e5sm21249161wrs.84.2020.11.16.05.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 05:14:26 -0800 (PST)
Date: Mon, 16 Nov 2020 08:14:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] vhost,vdpa: fixes
Message-ID: <20201116081420-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: lvivier@redhat.com, sfr@canb.auug.org.au, lkp@intel.com,
 kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, stefanha@redhat.com,
 michael.christie@oracle.com
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

The following changes since commit 0c86d774883fa17e7c81b0c8838b88d06c2c911e:

  vdpasim: allow to assign a MAC address (2020-10-30 04:04:35 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to efd838fec17bd8756da852a435800a7e6281bfbc:

  vhost scsi: Add support for LUN resets. (2020-11-15 17:30:55 -0500)

----------------------------------------------------------------
vhost,vdpa: fixes

Fixes all over the place, most notably vhost scsi IO error fixes.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Laurent Vivier (1):
      vdpasim: fix "mac_pton" undefined error

Mike Christie (5):
      vhost: add helper to check if a vq has been setup
      vhost scsi: alloc cmds per vq instead of session
      vhost scsi: fix cmd completion race
      vhost scsi: add lun parser helper
      vhost scsi: Add support for LUN resets.

Stephen Rothwell (1):
      swiotlb: using SIZE_MAX needs limits.h included

 drivers/vdpa/Kconfig    |   1 +
 drivers/vhost/scsi.c    | 397 ++++++++++++++++++++++++++++++++++--------------
 drivers/vhost/vhost.c   |   6 +
 drivers/vhost/vhost.h   |   1 +
 include/linux/swiotlb.h |   1 +
 5 files changed, 289 insertions(+), 117 deletions(-)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
