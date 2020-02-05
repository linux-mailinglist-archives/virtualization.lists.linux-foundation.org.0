Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 752031527A5
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 09:51:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F124985CA8;
	Wed,  5 Feb 2020 08:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4HG39zfIlKF; Wed,  5 Feb 2020 08:51:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0880085BEE;
	Wed,  5 Feb 2020 08:51:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA1B8C0174;
	Wed,  5 Feb 2020 08:51:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1E4BC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 08:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DD03C20371
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 08:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uP5uetyeFaWd
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 08:51:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id C59431FDFB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 08:51:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 00:50:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,405,1574150400"; d="scan'208";a="220032713"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga007.jf.intel.com with ESMTP; 05 Feb 2020 00:50:59 -0800
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 00:50:59 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 00:50:58 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.126]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.76]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 16:50:56 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: Balloon pressuring page cache
Thread-Topic: Balloon pressuring page cache
Thread-Index: AQHV1jovoZrFI2PKjUOgo5GIAcuyoKgA6/YAgACRPICAAUzXAIAAibNg///JVwCABdc9AIAANGSAgAAETACAAGklgIAAo12AgAABfACAAGGxgIAAJx2AgAFxBnD//33eAIAAiZEA
Date: Wed, 5 Feb 2020 08:50:55 +0000
Message-ID: <286AC319A985734F985F78AFA26841F73E41F2D9@shsmsx102.ccr.corp.intel.com>
References: <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
 <d69eafb4-ad0d-1617-9248-ea4fc776da58@redhat.com>
 <20200204033657-mutt-send-email-mst@kernel.org>
 <ce93331c-0099-dda7-e00f-126bf7826a40@redhat.com>
 <20200204114336-mutt-send-email-mst@kernel.org>
 <286AC319A985734F985F78AFA26841F73E41F10F@shsmsx102.ccr.corp.intel.com>
 <20200205015911-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200205015911-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Tyler Sanderson <tysand@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Nadav Amit <namit@vmware.com>, David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>, Michal
 Hocko <mhocko@kernel.org>
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

On Wednesday, February 5, 2020 3:05 PM, Michael S. Tsirkin wrote:
> 
> Well if we did the hint would be reliable, allowing host to immediately drop
> any pages it gets in the hint. 

"drop", you mean host to unmap the page from guest? I think that's not allowed for hints.

> Originally I wanted to speed up hinting by never
> waiting for host, but that does not seem to be what was
> implemented: the only place we don't wait is the shrinker

Didn't get this one. For FREE_PAGE_HINT, the hints are always sent to host without
an ack from host about whether it has read the hint or not. (please see get_free_page_and_send)

> and it seems a
> waste that we introduced complexity to host without getting any real
> benefit out of it.
> 
> VIRTIO_BALLOON_F_MUST_TELL_HOST doesn't really apply to hinting right
> now, 

There is no need I think, as host isn't allowed to use or unmap the hint page.

Best,
Wei

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
