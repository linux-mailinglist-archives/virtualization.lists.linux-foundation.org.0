Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C053C8054
	for <lists.virtualization@lfdr.de>; Wed, 14 Jul 2021 10:34:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 591F060A82;
	Wed, 14 Jul 2021 08:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmA7lqRAdWD1; Wed, 14 Jul 2021 08:34:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C741760A77;
	Wed, 14 Jul 2021 08:34:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67F24C0021;
	Wed, 14 Jul 2021 08:34:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28242C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 08:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99DC360A7E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 08:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ImxnOIDSSQo
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 08:34:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC3646089F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 08:34:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="271420775"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="271420775"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 01:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="571083606"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58])
 ([10.239.154.58])
 by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2021 01:33:54 -0700
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
 <20210713113607-mutt-send-email-mst@kernel.org>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <16bed918-f26a-cc20-0566-54c70d453179@intel.com>
Date: Wed, 14 Jul 2021 16:33:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210713113607-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Cc: yu1.wang@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 viresh.kumar@linaro.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, wsa@kernel.org,
 wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
 stefanha@redhat.com, shuo.a.liu@intel.com, andriy.shevchenko@linux.intel.com,
 conghui.chen@intel.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMjAyMS83LzEzIDIzOjM4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cgo+Cj4gSSB0aGlu
ayB3ZSBzaG91bGQgdHdlYWsgdGhpcyBzdWNoIHRoYXQgd2UgYWRkIG11bHRpcGxlIGJ1ZmZlcnMg
YnV0Cj4gb25seSBtYWtlIHRoZW0gdmlzaWJsZSB0byBob3N0IGFmdGVyIGFsbCBhZGQgY29tbWFu
ZHMgd2VyZSBzdWNjZXNzZnVsLgo+IFdpdGggc3BsaXQgdGhpcyBpcyBwb3NzaWJsZSBieSBkZWZm
ZXJpbmcgYXZhaWwgaWR4IHVwZGF0ZSwKPiB3aXRoIHBhY2tlZCBieSBkZWZlcnJpbmcgdXBkYXRl
IG9mIHRoZSBhdmFpbCBiaXQgaW4gdGhlIGRlc2NyaXB0b3IuCj4gSSdsbCB3cml0ZSBhIHBhdGNo
IHRvIGFkZCBhbiBBUEkgbGlrZSB0aGF0IHRvIHZpcnRpbywgdGhlbiB3ZQo+IGNhbiBzd2l0Y2gg
dG8gdGhhdC4KPgoKVGhhdCdzIGdyZWF0ICHCoCBMb29raW5nIGZvcndhcmQgdG8gc2VlaW5nIHRo
YXQgQVBJLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
