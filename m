Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F29426833F
	for <lists.virtualization@lfdr.de>; Mon, 14 Sep 2020 05:43:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE48785DBB;
	Mon, 14 Sep 2020 03:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q+wODVarZbZD; Mon, 14 Sep 2020 03:43:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1421486156;
	Mon, 14 Sep 2020 03:43:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF3D6C0859;
	Mon, 14 Sep 2020 03:43:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AD0FC0859
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 03:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 425EF843EE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 03:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jzPEEZjGmIO
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 03:43:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B1AA184186
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 03:43:29 +0000 (UTC)
IronPort-SDR: E4v0za1YNmXSlRHpD7lr46pFjHADujq26gz5fR5sHRLDBekyEElvjEcMCvEQJ3GdqO7bHqMoZC
 lzwXkrgLM99g==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="156416766"
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; d="scan'208";a="156416766"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 20:43:28 -0700
IronPort-SDR: lGgbCcMEZ4sdx2FC0HRh5wiQW5m18WKxyFO3dMxM1/hhtLs19Vrgz/VTij1piExuLa8iDKFOb3
 WQXBdxBkXZIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; d="scan'208";a="330567584"
Received: from unknown (HELO [10.239.154.46]) ([10.239.154.46])
 by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2020 20:43:24 -0700
Subject: Re: [PATCH v2] i2c: virtio: add a virtio i2c frontend driver
To: Jason Wang <jasowang@redhat.com>, linux-i2c@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <c4bd4fd56df36864ed34d3572f00b2b838fd833a.1599795029.git.jie.deng@intel.com>
 <ce6b55d9-dfda-4387-0e04-0d50437355f0@redhat.com>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <9b18d14b-af69-eb12-34a3-83feb124083f@intel.com>
Date: Mon, 14 Sep 2020 11:43:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <ce6b55d9-dfda-4387-0e04-0d50437355f0@redhat.com>
Content-Language: en-US
Cc: Sergey.Semin@baikalelectronics.ru, bjorn.andersson@linaro.org,
 loic.poulain@linaro.org, yu1.wang@intel.com, mst@redhat.com, krzk@kernel.org,
 tali.perry1@gmail.com, wsa@kernel.org, wsa+renesas@sang-engineering.com,
 jarkko.nikula@linux.intel.com, rppt@kernel.org, shuo.a.liu@intel.com,
 andriy.shevchenko@linux.intel.com, conghui.chen@intel.com, jdelvare@suse.de
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

Ck9uIDIwMjAvOS8xNCAxMDo0NiwgSmFzb24gV2FuZyB3cm90ZToKPgo+PiArCj4+ICsjZGVmaW5l
IFZJUlRJT19JMkNfTVNHX09LwqDCoMKgIDAKPj4gKyNkZWZpbmUgVklSVElPX0kyQ19NU0dfRVJS
wqDCoMKgIDEKPj4gKwo+PiArLyoqCj4+ICsgKiBzdHJ1Y3QgdmlydGlvX2kyY19oZHIgLSB0aGUg
dmlydGlvIEkyQyBtZXNzYWdlIGhlYWRlciBzdHJ1Y3R1cmUKPj4gKyAqIEBhZGRyOiBpMmNfbXNn
IGFkZHIsIHRoZSBzbGF2ZSBhZGRyZXNzCj4+ICsgKiBAZmxhZ3M6IGkyY19tc2cgZmxhZ3MKPj4g
KyAqIEBsZW46IGkyY19tc2cgbGVuCj4+ICsgKi8KPj4gK3N0cnVjdCB2aXJ0aW9faTJjX2hkciB7
Cj4+ICvCoMKgwqAgX19sZTE2IGFkZHI7Cj4+ICvCoMKgwqAgX19sZTE2IGZsYWdzOwo+PiArwqDC
oMKgIF9fbGUxNiBsZW47Cj4+ICt9Owo+Cj4KPiBBcyBzYWlkIGluIHYxLCB0aGlzIHNob3VsZCBi
ZWxvbmcgdG8gdWFwaS4KPgpUaGF0J3MgcmlnaHQuIEkgbWlzc2VkIHRoaXMuCkkgd2lsbCBtb3Zl
IHRoZXNlIHRoaW5ncyB0byB1YXBpLiBUaGFua3MuCgoKPgo+PiArCj4+ICsvKioKPj4gKyAqIHN0
cnVjdCB2aXJ0aW9faTJjX21zZyAtIHRoZSB2aXJ0aW8gSTJDIG1lc3NhZ2Ugc3RydWN0dXJlCj4+
ICsgKiBAaGRyOiB0aGUgdmlydGlvIEkyQyBtZXNzYWdlIGhlYWRlcgo+PiArICogQGJ1Zjogdmly
dGlvIEkyQyBtZXNzYWdlIGRhdGEgYnVmZmVyCj4+ICsgKiBAc3RhdHVzOiB0aGUgcHJvY2Vzc2lu
ZyByZXN1bHQgZnJvbSB0aGUgYmFja2VuZAo+PiArICovCj4+ICtzdHJ1Y3QgdmlydGlvX2kyY19t
c2cgewo+PiArwqDCoMKgIHN0cnVjdCB2aXJ0aW9faTJjX2hkciBoZHI7Cj4+ICvCoMKgwqAgdTgg
KmJ1ZjsKPj4gK8KgwqDCoCB1OCBzdGF0dXM7Cj4+ICt9Owo+Cj4KPiBJJ20gbm90IHF1aXRlIHN1
cmUgdGhpcyBpcyB0aGUgYmVzdCBsYXlvdXQuCj4KPiBFLmcgdmlydGlvIHNjc2kgZGlmZmVyIGlu
IGJ1ZmZlciBvdXQgb2Ygb3V0IG9uZToKPgo+IHN0cnVjdHZpcnRpb19zY3NpX3JlcV9jbWR7Cj4g
Li4uCj4gdTggZGF0YW91dFtdOwo+IC4uLgo+IHU4IGRhdGFpbltdOwo+Cj4gfQo+Cj4gQW5kIEkg
d291bGQgbGlrZSB0byBoYXZlIGEgbG9vayBhdCB0aGUgc3BlYyBwYXRjaC4KPgo+IFRoYW5rcwo+
ClN1cmUuIEkgd2lsbCBzZW5kIHRoZSB2MyBhbG9uZyB3aXRoIHRoZSBzcGVjIHBhdGNoLgpUaGFu
a3MuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
