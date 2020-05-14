Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0EE1D3068
	for <lists.virtualization@lfdr.de>; Thu, 14 May 2020 14:55:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 76ED287586;
	Thu, 14 May 2020 12:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oyo0DQqEjsoB; Thu, 14 May 2020 12:55:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 93A3E87560;
	Thu, 14 May 2020 12:55:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 760AEC016F;
	Thu, 14 May 2020 12:55:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E18C1C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C950D8972C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2DMPkAouKkF3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:55:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2C2038972B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:55:47 +0000 (UTC)
IronPort-SDR: cNbZwM0GVacnhenK+DFmY66HMu1x5TLa4nm7KSPG3OR7U+dq3x2szCPBlbQ6Vl/mA0ygBvVBRI
 FlrzyO3sXGgA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2020 05:55:46 -0700
IronPort-SDR: KnyTBBvcjDgpGVaahL55/5JbDzzgPmdd6ZpkrFJHpXgJORE60fwRPSSeVKrpE0/meZtZoGKVT/
 sNGU16Mkpsog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; d="scan'208";a="287406326"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.39.186])
 by fmsmga004.fm.intel.com with ESMTP; 14 May 2020 05:55:45 -0700
Date: Thu, 14 May 2020 14:55:44 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: virtualization@lists.linux-foundation.org
Subject: [Q] vhost: returning misconfigured buffers
Message-ID: <20200514125543.GA12665@ubuntu>
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

Many vhost drivers follow a common process to obtain and verify 
received buffers:

head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov), &out, &in,...);
if (head < 0) {
	return ret;
}
if (head == vq->num) {
	/* no buffer */
	return 0; /* or -EAGAIN or whatever */
}
if (out != EXPECTED_OUT_BUFFERS || in != EXPECTED_IN_BUFFERS) {
	return -EINVAL;
}
/* all good, use buffers */
vhost_add_used(...);

Which seems to me to be leaking buffers in the last error case - 
if the buffer configuration was unexpected. Shouldn't drivers in 
such cases also use vhost_add_used() to return the buffer?

Thanks
Guennadi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
