Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E72C00A8
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 10:07:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D8FBAFA0;
	Fri, 27 Sep 2019 08:07:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EC5CBB8E
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:07:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 976088A0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:07:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Sep 2019 01:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,554,1559545200"; d="scan'208";a="201940621"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.73])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2019 01:06:58 -0700
Date: Fri, 27 Sep 2019 16:04:10 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
Message-ID: <20190927080410.GA22568@___>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<1b4b8891-8c14-1c85-1d6a-2eed1c90bcde@redhat.com>
	<20190927045438.GA17152@___>
	<49bb0777-3761-3737-8e5b-568957f9a935@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49bb0777-3761-3737-8e5b-568957f9a935@redhat.com>
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

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDM6MTQ6NDJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzkvMjcg5LiL5Y2IMTI6NTQsIFRpd2VpIEJpZSB3cm90ZToKPiA+ID4gPiAr
Cj4gPiA+ID4gKwkJLyoKPiA+ID4gPiArCQkgKiBJbiB2aG9zdC1tZGV2LCB1c2Vyc3BhY2Ugc2hv
dWxkIHBhc3MgcmluZyBhZGRyZXNzZXMKPiA+ID4gPiArCQkgKiBpbiBndWVzdCBwaHlzaWNhbCBh
ZGRyZXNzZXMgd2hlbiBJT01NVSBpcyBkaXNhYmxlZCBvcgo+ID4gPiA+ICsJCSAqIElPVkFzIHdo
ZW4gSU9NTVUgaXMgZW5hYmxlZC4KPiA+ID4gPiArCQkgKi8KPiA+ID4gQSBxdWVzdGlvbiBoZXJl
LCBjb25zaWRlciB3ZSdyZSB1c2luZyBub2lvbW11IG1vZGUuIElmIGd1ZXN0IHBoeXNpY2FsCj4g
PiA+IGFkZHJlc3MgaXMgcGFzc2VkIGhlcmUsIGhvdyBjYW4gYSBkZXZpY2UgdXNlIHRoYXQ/Cj4g
PiA+IAo+ID4gPiBJIGJlbGlldmUgeW91IG1lYW50ICJob3N0IHBoeXNpY2FsIGFkZHJlc3MiIGhl
cmU/IEFuZCBpdCBhbHNvIGhhdmUgdGhlCj4gPiA+IGltcGxpY2F0aW9uIHRoYXQgdGhlIEhQQSBz
aG91bGQgYmUgY29udGludW91cyAoZS5nIHVzaW5nIGh1Z2V0bGJmcykuCj4gPiBUaGUgY29tbWVu
dCBpcyB0YWxraW5nIGFib3V0IHRoZSB2aXJ0dWFsIElPTU1VIChpLmUuIGlvdGxiIGluIHZob3N0
KS4KPiA+IEl0IHNob3VsZCBiZSByZXBocmFzZWQgdG8gY292ZXIgdGhlIG5vaW9tbXUgY2FzZSBh
cyB3ZWxsLiBUaGFua3MgZm9yCj4gPiBzcG90dGluZyB0aGlzLgo+IAo+IAo+IFNvIHRoZSBxdWVz
dGlvbiBzdGlsbCwgaWYgR1BBIGlzIHBhc3NlZCBob3cgY2FuIGl0IGJlIHVzZWQgYnkgdGhlCj4g
dmlydGlvLW1kZXYgZGV2aWNlPwoKU29ycnkgaWYgSSBkaWRuJ3QgbWFrZSBpdCBjbGVhci4uCk9m
IGNvdXJzZSwgR1BBIGNhbid0IGJlIHBhc3NlZCBpbiBub2lvbW11IG1vZGUuCgoKPiAKPiBUaGFu
a3MKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
