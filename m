Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D192135ABC
	for <lists.virtualization@lfdr.de>; Thu,  9 Jan 2020 14:56:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EFF8E869B4;
	Thu,  9 Jan 2020 13:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Och-hzkVgmb6; Thu,  9 Jan 2020 13:56:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C574D868CA;
	Thu,  9 Jan 2020 13:56:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6FF2C0881;
	Thu,  9 Jan 2020 13:56:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACCA1C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 13:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A20F2203C8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 13:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oaFWS3CGZAOO
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 13:56:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by silver.osuosl.org (Postfix) with ESMTPS id E992B20014
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 13:56:18 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 05:56:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; d="scan'208";a="423258258"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.36.231])
 by fmsmga006.fm.intel.com with ESMTP; 09 Jan 2020 05:56:17 -0800
Date: Thu, 9 Jan 2020 14:56:16 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: virtualization@lists.linux-foundation.org
Subject: [Q] guest identification and host runtime PM
Message-ID: <20200109135615.GA20339@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi,

I'm working on a VirtIO / vhost audio virtualisation solution [1,2]
and although it's already working rather well, some points still need
clarification.

1. Guest identification. Is there a standard way to identify guests in
   a vhost driver? We need to send different audio topology to
   different guests, therefore we need a way to reliably identify
   them.

2. Runtime PM. Is there a standard or a preferred way to implement
   runtime PM on the host side to guarantee that the device is always
   powered on when guests need it and can be runtime suspended
   otherwise?

Thanks
Guennadi

[1] https://github.com/thesofproject/sof-docs/pull/155
[2] https://github.com/thesofproject/linux/pull/1501
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
