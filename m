Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74E123DBB
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 04:11:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0587586987;
	Wed, 18 Dec 2019 03:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xbxzZhfsj5di; Wed, 18 Dec 2019 03:11:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 07F9085B99;
	Wed, 18 Dec 2019 03:11:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4F63C077D;
	Wed, 18 Dec 2019 03:11:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9550FC077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 03:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8E64086987
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 03:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fxVqfqr2kaSE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 03:11:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 142DC85B99
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 03:11:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 19:11:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="247717343"
Received: from unknown (HELO [10.239.13.7]) ([10.239.13.7])
 by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2019 19:11:38 -0800
Message-ID: <5DF99A95.8050800@intel.com>
Date: Wed, 18 Dec 2019 11:18:45 +0800
From: Wei Wang <wei.w.wang@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Daniel Verkamp <dverkamp@chromium.org>, 
 virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 1/2] virtio-balloon: initialize all vq callbacks
References: <20191217190610.248061-1-dverkamp@chromium.org>
In-Reply-To: <20191217190610.248061-1-dverkamp@chromium.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 12/18/2019 03:06 AM, Daniel Verkamp wrote:
> Ensure that elements of the array that correspond to unavailable
> features are set to NULL; previously, they would be left uninitialized.
>
> Since the corresponding names array elements were explicitly set to
> NULL, the uninitialized callback pointers would not actually be
> dereferenced; however, the uninitialized callbacks elements would still
> be read in vp_find_vqs_msix() and used to calculate the number of MSI-X
> vectors required.

With your 2nd patch:
if (names[i] && callbacks[i])
     ++nvectors;

It seems this patch isn't necessary as names[i] is already NULL, isn't it?

Best,
Wei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
