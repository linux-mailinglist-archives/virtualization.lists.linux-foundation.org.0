Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A17BFE29
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 06:29:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 169E8F2B;
	Fri, 27 Sep 2019 04:29:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E0752B43
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 04:29:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D0B7B8A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 04:29:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2019 21:29:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,554,1559545200"; d="scan'208";a="196598843"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.73])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2019 21:29:44 -0700
Date: Fri, 27 Sep 2019 12:26:57 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
Message-ID: <20190927042657.GA16052@___>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<1b4b8891-8c14-1c85-1d6a-2eed1c90bcde@redhat.com>
	<996bcaa3-1b13-2520-5be4-8a8f9c8c71d6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <996bcaa3-1b13-2520-5be4-8a8f9c8c71d6@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTE6NTE6MzVBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzkvMjcg5LiK5Y2IMTE6NDYsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiArCj4g
PiArc3RhdGljIHN0cnVjdCBtZGV2X2NsYXNzX2lkIGlkX3RhYmxlW10gPSB7Cj4gPiArwqDCoMKg
IHsgTURFVl9JRF9WSE9TVCB9LAo+ID4gK8KgwqDCoCB7IDAgfSwKPiA+ICt9Owo+ID4gKwo+ID4g
K3N0YXRpYyBzdHJ1Y3QgbWRldl9kcml2ZXIgdmhvc3RfbWRldl9kcml2ZXIgPSB7Cj4gPiArwqDC
oMKgIC5uYW1lwqDCoMKgID0gInZob3N0X21kZXYiLAo+ID4gK8KgwqDCoCAucHJvYmXCoMKgwqAg
PSB2aG9zdF9tZGV2X3Byb2JlLAo+ID4gK8KgwqDCoCAucmVtb3ZlwqDCoMKgID0gdmhvc3RfbWRl
dl9yZW1vdmUsCj4gPiArwqDCoMKgIC5pZF90YWJsZSA9IGlkX3RhYmxlLAo+ID4gK307Cj4gPiAr
Cj4gCj4gCj4gQW5kIHlvdSBwcm9iYWJseSBuZWVkIHRvIGFkZCBNT0RVTEVfREVWSUNFX1RBQkxF
KCkgYXMgd2VsbC4KClllYWgsIHRoYW5rcyEKCgo+IAo+IFRoYW5rcwo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
