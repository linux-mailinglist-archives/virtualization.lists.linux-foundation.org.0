Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 694EE1C3915
	for <lists.virtualization@lfdr.de>; Mon,  4 May 2020 14:15:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EAF5F22E1C;
	Mon,  4 May 2020 12:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vp4Di7xum1Dg; Mon,  4 May 2020 12:15:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8235E20404;
	Mon,  4 May 2020 12:15:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7211EC0175;
	Mon,  4 May 2020 12:15:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6993FC0175
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 12:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 51A0C8793F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 12:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71xbHchx8Ky8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 12:15:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9BC978785E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 12:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588594547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=q5qLe/YbLa8g+76m0wKCJz9sEFGWHkbwiwLtZx/ZVFk=;
 b=BoupBZjinqWOG60CRL1nwi+ttchJJbX0UNYWrTc0U4ZfNvu8j01xdyxYUaoMen9ob3/VDH
 7+LD20bUUoSII35T8mXnqx1GIKOuO0P4it5g/LcjFyLFTrwGngSlhuHxMoamfcPP0o91iJ
 2DHfcVLnxELFkWrWpBwBu80wkVqpQRI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-sau7TL6yO_WfXUn7NE8rdQ-1; Mon, 04 May 2020 08:15:43 -0400
X-MC-Unique: sau7TL6yO_WfXUn7NE8rdQ-1
Received: by mail-wr1-f70.google.com with SMTP id r11so10636903wrx.21
 for <virtualization@lists.linux-foundation.org>;
 Mon, 04 May 2020 05:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=q5qLe/YbLa8g+76m0wKCJz9sEFGWHkbwiwLtZx/ZVFk=;
 b=FJxVthFnYUaMmFI7HyL86tfEEPYVj2aNpzahns5kJKl72MOFQ83irwsuGZSkfHRXl/
 yblRELd/ao11S6qB/n5CGbRQk7BBvutJsnKPWns7fJqsVlA9fcK3n6qRPA9SkChHSm5o
 n//4/3Zu885DJ18ChFnXrwkCwju4zQl8AHAvFDB8c77rNHAaEifaOgJmZwcRv6bcZoTA
 zXr4OtEmM4ftu18MO2YoCluSx9ssTy0lc9xQ8D2I9u1M/1LvVrIljZl38R8sGi2Birys
 Nd+5nC4QlJqyZQ9SLPj/HPpfW1seBGCgf16kz5nunup2ZhqUNw/CHaNButAq8Fn4GJuQ
 TheA==
X-Gm-Message-State: AGi0PubJoDa9btKaxVZJ1OJlaiIMyTD297Ykyd4vVWYmSWUyJf0VR0EK
 ok6b91aIe2aMqBXXCaOEKX8SkX8GcCtb1I0PcwC0ZbahcmEfINYMWOPYvwAB946+lBeV5ekaWRE
 2tB3Hzd3TNSZTslrjWSFNzUugFZNAxoUjsW+SGbpK6w==
X-Received: by 2002:a1c:4e06:: with SMTP id g6mr14085621wmh.186.1588594542756; 
 Mon, 04 May 2020 05:15:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypIAWbJGa73k/tJK0QUm1DfayD29dwoou70hN0HhHJnMSNr/UKPo3sTuvVCseBF2z+tgI/8tzQ==
X-Received: by 2002:a1c:4e06:: with SMTP id g6mr14085601wmh.186.1588594542532; 
 Mon, 04 May 2020 05:15:42 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 s24sm13455322wmj.28.2020.05.04.05.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 05:15:41 -0700 (PDT)
Date: Mon, 4 May 2020 08:15:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] vhost: fixes
Message-ID: <20200504081540-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: n.b@live.com, justin.he@arm.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, ldigby@redhat.com, linux-kernel@vger.kernel.org,
 stefanha@redhat.com, virtualization@lists.linux-foundation.org
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

The following changes since commit 6a8b55ed4056ea5559ebe4f6a4b247f627870d4c:

  Linux 5.7-rc3 (2020-04-26 13:51:02 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 0b841030625cde5f784dd62aec72d6a766faae70:

  vhost: vsock: kick send_pkt worker once device is started (2020-05-02 10:28:21 -0400)

----------------------------------------------------------------
virtio: fixes

A couple of bug fixes.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Jia He (1):
      vhost: vsock: kick send_pkt worker once device is started

Stefan Hajnoczi (1):
      virtio-blk: handle block_device_operations callbacks after hot unplug

 drivers/block/virtio_blk.c | 86 +++++++++++++++++++++++++++++++++++++++++-----
 drivers/vhost/vsock.c      |  5 +++
 2 files changed, 83 insertions(+), 8 deletions(-)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
