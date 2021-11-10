Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7914344CA11
	for <lists.virtualization@lfdr.de>; Wed, 10 Nov 2021 21:05:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 029ED81852;
	Wed, 10 Nov 2021 20:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSZP4IGfcbCi; Wed, 10 Nov 2021 20:05:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 84D5B80DE3;
	Wed, 10 Nov 2021 20:05:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C840C0036;
	Wed, 10 Nov 2021 20:05:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 770A3C001E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Nov 2021 20:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5608360AFA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Nov 2021 20:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWcZXElqugjG
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Nov 2021 20:05:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by smtp3.osuosl.org (Postfix) with ESMTP id D152260775
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Nov 2021 20:05:33 +0000 (UTC)
Received: from [128.177.79.46] (helo=[10.118.101.22])
 by outgoing-stata.csail.mit.edu with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.82)
 (envelope-from <srivatsa@csail.mit.edu>)
 id 1mktqd-000YWI-51; Wed, 10 Nov 2021 15:05:31 -0500
Subject: [PATCH v3 2/3] MAINTAINERS: Add Zack as maintainer of vmmouse driver
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: jgross@suse.com, x86@kernel.org, pv-drivers@vmware.com
Date: Wed, 10 Nov 2021 12:08:45 -0800
Message-ID: <163657490344.84207.11803468380735093749.stgit@srivatsa-dev>
In-Reply-To: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
References: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
User-Agent: StGit/0.21
MIME-Version: 1.0
Cc: anishs@vmware.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 virtualization@lists.linux-foundation.org, keerthanak@vmware.com,
 kuba@kernel.org, linux-graphics-maintainer@vmware.com, amakhalov@vmware.com,
 joe@perches.com, namit@vmware.com, Zack Rusin <zackr@vmware.com>
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

From: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>

Zack Rusin will be taking over the maintainership of the VMware
vmmouse driver. Update the MAINTAINERS file to reflect this change.

Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
Acked-by: Zack Rusin <zackr@vmware.com>
Cc: linux-graphics-maintainer@vmware.com
Cc: pv-drivers@vmware.com
Cc: linux-input@vger.kernel.org
Cc: stable@vger.kernel.org
---

 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0329d67c5bcf..21c0e49b80b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20079,6 +20079,7 @@ S:	Maintained
 F:	drivers/misc/vmw_vmci/
 
 VMWARE VMMOUSE SUBDRIVER
+M:	Zack Rusin <zackr@vmware.com>
 M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
 M:	"VMware, Inc." <pv-drivers@vmware.com>
 L:	linux-input@vger.kernel.org

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
