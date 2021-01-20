Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ECA2FD5AD
	for <lists.virtualization@lfdr.de>; Wed, 20 Jan 2021 17:32:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8029A870D6;
	Wed, 20 Jan 2021 16:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0SvMhFMVdEUf; Wed, 20 Jan 2021 16:32:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A92FC870E5;
	Wed, 20 Jan 2021 16:32:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 867F0C013A;
	Wed, 20 Jan 2021 16:32:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38807C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 16:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2041C866B0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 16:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryk2vgEDMmA8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 16:32:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7410E866AE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 16:32:07 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 20 Jan 2021 08:31:59 -0800
Received: from sc-dbc2115.eng.vmware.com (sc-dbc2115.eng.vmware.com
 [10.182.28.6])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 67BC5207BD;
 Wed, 20 Jan 2021 08:32:04 -0800 (PST)
From: Jorgen Hansen <jhansen@vmware.com>
To: <linux-kernel@vger.kernel.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH v2 0/3] VMCI: Queue pair bug fixes
Date: Wed, 20 Jan 2021 08:32:04 -0800
Message-ID: <1611160324-30066-1-git-send-email-jhansen@vmware.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: jhansen@vmware.com does not
 designate permitted sender hosts)
Cc: pv-drivers@vmware.com, gregkh@linuxfoundation.org,
 Jorgen Hansen <jhansen@vmware.com>
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

This series contains three bug fixes for the queue pair
implementation in the VMCI driver.

v1 -> v2:
  - format patches as a series
  - use min_t instead of min to ensure size_t comparison
    (issue pointed out by kernel test robot <lkp@intel.com>)

Jorgen Hansen (3):
  VMCI: Stop log spew when qp allocation isn't possible
  VMCI: Use set_page_dirty_lock() when unregistering guest memory
  VMCI: Enforce queuepair max size for IOCTL_VMCI_QUEUEPAIR_ALLOC

 drivers/misc/vmw_vmci/vmci_queue_pair.c | 16 ++++++++++------
 include/linux/vmw_vmci_defs.h           |  4 ++--
 2 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.6.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
