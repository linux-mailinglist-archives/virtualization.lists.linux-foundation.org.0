Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A161E1F79
	for <lists.virtualization@lfdr.de>; Tue, 26 May 2020 12:16:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B019B87117;
	Tue, 26 May 2020 10:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kxm8kUxbJbzV; Tue, 26 May 2020 10:16:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 27E2486DF4;
	Tue, 26 May 2020 10:16:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04420C0895;
	Tue, 26 May 2020 10:16:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA74BC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 10:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DFBFC85F5C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 10:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDBjlx0HRT51
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 10:16:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 79ECE85F6A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 10:16:06 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCFCC2071A;
 Tue, 26 May 2020 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590488166;
 bh=DzkBbf5oeb0cdW/wBmldy6tJQZjMEl25csjKMddYnIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yZXVYDMwFyOehlszO1skMSh1i+h/5sEoMPwspgXHpC8k3/QQFMt3DrpNM3W3/MUmv
 o0BjSup1f2WZNzuWf82VDHZXpDpIIfENe2npzqEclr3Rjr0gQyLdR9t98+h9OKRPtf
 OVO/lXIBLdJ0HZkW1fVSLDuTMVO3t7jR9Hszdrkk=
Date: Tue, 26 May 2020 12:16:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [v2 2/2] crypto: virtio: Fix use-after-free in
 virtio_crypto_skcipher_finalize_req()
Message-ID: <20200526101604.GB2759907@kroah.com>
References: <20200526031956.1897-1-longpeng2@huawei.com>
 <20200526031956.1897-3-longpeng2@huawei.com>
 <0248e0f6-7648-f08d-afa2-170ad2e724b7@web.de>
 <03d3387f-c886-4fb9-e6f2-9ff8dc6bb80a@huawei.com>
 <8aab4c6b-7d41-7767-4945-e8af1dec902b@web.de>
 <321c79df-6397-bbf1-0047-b0b10e5af353@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <321c79df-6397-bbf1-0047-b0b10e5af353@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Markus Elfring <Markus.Elfring@web.de>, linux-crypto@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Corentin Labbe <clabbe@baylibre.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCBNYXkgMjYsIDIwMjAgYXQgMDU6MjQ6MDNQTSArMDgwMCwgTG9uZ3BlbmcgKE1pa2Us
IENsb3VkIEluZnJhc3RydWN0dXJlIFNlcnZpY2UgUHJvZHVjdCBEZXB0Likgd3JvdGU6Cj4gCj4g
Cj4gT24gMjAyMC81LzI2IDE3OjAxLCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPiA+Pj4+IOKApiBU
aHVzIHJlbGVhc2Ugc3BlY2lmaWMgcmVzb3VyY2VzIGJlZm9yZQo+ID4+Pgo+ID4+PiBJcyB0aGVy
ZSBhIG5lZWQgdG8gaW1wcm92ZSBhbHNvIHRoaXMgaW5mb3JtYXRpb24gYW5vdGhlciBiaXQ/Cj4g
Pj4+Cj4gPj4gWW91IG1lYW4gdGhlIGxhc3QgdHdvIHBhcmFncmFwaCBpcyByZWR1bmRhbnQgPwo+
ID4gCj4gPiBOby4KPiA+IAo+ID4gSSBiZWNhbWUgY3VyaW91cyBpZiB5b3Ugd291bGQgbGlrZSB0
byBjaG9vc2UgYSBtb3JlIGhlbHBmdWwgaW5mb3JtYXRpb24KPiA+IGFjY29yZGluZyB0byB0aGUg
d29yZGluZyDigJxzcGVjaWZpYyByZXNvdXJjZXPigJ0uCj4gPiAKPiA+IFJlZ2FyZHMsCj4gPiBN
YXJrdXMKPiA+IAo+IEhpIE1hcmt1cywKPiAKPiBJIHJlc3BlY3QgeW91ciB3b3JrLCBidXQgcGxl
YXNlIGxldCB1cyB0byBmb2N1cyBvbiB0aGUgY29kZSBpdHNlbGYuIEkgdGhpbmsKPiBleHBlcnRz
IGluIHRoaXMgYXJlYSBrbm93IHdoYXQgdGhlc2UgcGF0Y2hlcyB3YW50IHRvIHNvbHZlIGFmdGVy
IGxvb2sgYXQgdGhlIGNvZGUuCj4gCj4gSSBob3BlIGV4cGVydHMgaW4gdGhlIHRocmVhZCBjb3Vs
ZCByZXZpZXcgdGhlIGNvZGUgd2hlbiB5b3UgZnJlZSwgdGhhbmtzIDopCgpQbGVhc2Ugbm90ZSB0
aGF0IHlvdSBhcmUgcmVzcG9uZGluZyB0byBzb21lb25lIHdobyBpcyBrbm93biB0byBiZSBhIHBh
aW4KaW4gcGF0Y2ggcmV2aWV3cyBhbmQgaGFzIGJlZW4gYmxvY2tlZCBieSBtYW55IGtlcm5lbApk
ZXZlbG9wZXJzL21haW50YWluZXJzIGJlY2F1c2UgdGhleSBqdXN0IHdhc3RlIHBlb3BsZSdzIHRp
bWUuCgpJIHN1Z2dlc3QgeW91IGFsbCBkbyB0aGUgc2FtZSBoZXJlLCBhbmQganVzdCBpZ25vcmUg
dGhlbSwgbGlrZSBJIGRvIDopCgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
