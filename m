Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF0B6D00C
	for <lists.virtualization@lfdr.de>; Thu, 18 Jul 2019 16:44:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 710F81701;
	Thu, 18 Jul 2019 14:44:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 951611674
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 14:43:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 326418F4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 14:43:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83C208A004;
	Thu, 18 Jul 2019 14:43:55 +0000 (UTC)
Received: from redhat.com (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BF4B6056F;
	Thu, 18 Jul 2019 14:43:47 +0000 (UTC)
Date: Thu, 18 Jul 2019 10:43:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] virtio-net: parameterize min ring num_free for virtio
	receive
Message-ID: <20190718104307-mutt-send-email-mst@kernel.org>
References: <BYAPR14MB32056583C4963342F5D817C4A6C80@BYAPR14MB3205.namprd14.prod.outlook.com>
	<20190718085836-mutt-send-email-mst@kernel.org>
	<bdd30ef5-4f69-8218-eed0-38c6daac42db@redhat.com>
	<20190718103641-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718103641-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 18 Jul 2019 14:43:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"songliubraving@fb.com" <songliubraving@fb.com>,
	"kafai@fb.com" <kafai@fb.com>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"jiangran.jr@alibaba-inc.com" <jiangran.jr@alibaba-inc.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>,
	? jiang <jiangkidd@hotmail.com>, "yhs@fb.com" <yhs@fb.com>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMTA6NDI6NDdBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDEwOjAxOjA1UE0gKzA4MDAsIEph
c29uIFdhbmcgd3JvdGU6Cj4gPiAKPiA+IE9uIDIwMTkvNy8xOCDkuIvljYg5OjA0LCBNaWNoYWVs
IFMuIFRzaXJraW4gd3JvdGU6Cj4gPiA+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDEyOjU1OjUw
UE0gKzAwMDAsID8gamlhbmcgd3JvdGU6Cj4gPiA+ID4gVGhpcyBjaGFuZ2UgbWFrZXMgcmluZyBi
dWZmZXIgcmVjbGFpbSB0aHJlc2hvbGQgbnVtX2ZyZWUgY29uZmlndXJhYmxlCj4gPiA+ID4gZm9y
IGJldHRlciBwZXJmb3JtYW5jZSwgd2hpbGUgaXQncyBoYXJkIGNvZGVkIGFzIDEvMiAqIHF1ZXVl
IG5vdy4KPiA+ID4gPiBBY2NvcmRpbmcgdG8gb3VyIHRlc3Qgd2l0aCBxZW11ICsgZHBkaywgcGFj
a2V0IGRyb3BwaW5nIGhhcHBlbnMgd2hlbgo+ID4gPiA+IHRoZSBndWVzdCBpcyBub3QgYWJsZSB0
byBwcm92aWRlIGZyZWUgYnVmZmVyIGluIGF2YWlsIHJpbmcgdGltZWx5Lgo+ID4gPiA+IFNtYWxs
ZXIgdmFsdWUgb2YgbnVtX2ZyZWUgZG9lcyBkZWNyZWFzZSB0aGUgbnVtYmVyIG9mIHBhY2tldCBk
cm9wcGluZwo+ID4gPiA+IGR1cmluZyBvdXIgdGVzdCBhcyBpdCBtYWtlcyB2aXJ0aW9fbmV0IHJl
Y2xhaW0gYnVmZmVyIGVhcmxpZXIuCj4gPiA+ID4gCj4gPiA+ID4gQXQgbGVhc3QsIHdlIHNob3Vs
ZCBsZWF2ZSB0aGUgdmFsdWUgY2hhbmdlYWJsZSB0byB1c2VyIHdoaWxlIHRoZQo+ID4gPiA+IGRl
ZmF1bHQgdmFsdWUgYXMgMS8yICogcXVldWUgaXMga2VwdC4KPiA+ID4gPiAKPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBqaWFuZ2tpZGQ8amlhbmdraWRkQGhvdG1haWwuY29tPgo+ID4gPiBUaGF0IHdv
dWxkIGJlIG9uZSByZWFzb24sIGJ1dCBJIHN1c3BlY3QgaXQncyBub3QgdGhlCj4gPiA+IHRydWUg
b25lLiBJZiB5b3UgbmVlZCBtb3JlIGJ1ZmZlciBkdWUgdG8gaml0dGVyCj4gPiA+IHRoZW4ganVz
dCBpbmNyZWFzZSB0aGUgcXVldWUgc2l6ZS4gV291bGQgYmUgY2xlYW5lci4KPiA+ID4gCj4gPiA+
IAo+ID4gPiBIb3dldmVyIGFyZSB5b3Ugc3VyZSB0aGlzIGlzIHRoZSByZWFzb24gZm9yCj4gPiA+
IHBhY2tldCBkcm9wcz8gRG8geW91IHNlZSB0aGVtIGRyb3BwZWQgYnkgZHBkawo+ID4gPiBkdWUg
dG8gbGFjayBvZiBzcGFjZSBpbiB0aGUgcmluZz8gQXMgb3Bwb3NlZCB0bwo+ID4gPiBieSBndWVz
dD8KPiA+ID4gCj4gPiA+IAo+ID4gCj4gPiBCZXNpZGVzIHRob3NlLCB0aGlzIHBhdGNoIGRlcGVu
ZHMgb24gdGhlIHVzZXIgdG8gY2hvb3NlIGEgc3VpdGFibGUgdGhyZXNob2xkCj4gPiB3aGljaCBp
cyBub3QgZ29vZC4gWW91IG5lZWQgZWl0aGVyIGEgZ29vZCB2YWx1ZSB3aXRoIGRlbW9uc3RyYXRl
ZCBudW1iZXJzIG9yCj4gPiBzb21ldGhpbmcgc21hcnRlci4KPiA+IAo+ID4gVGhhbmtzCj4gCj4g
SSBkbyBob3dldmVyIHRoaW5rIHRoYXQgd2UgaGF2ZSBhIHByb2JsZW0gcmlnaHQgbm93OiB0cnlf
ZmlsbF9yZWN2IGNhbgo+IHRha2UgdXAgYSBsb25nIHRpbWUgZHVyaW5nIHdoaWNoIG5ldCBzdGFj
ayBkb2VzIG5vdCBydW4gYXQgYWxsLiBJbWFnaW5lCj4gYSAxSyBxdWV1ZSAtIHdlIGFyZSB0YWxr
aW5nIDUxMiBwYWNrZXRzLiBUaGF0J3MgZXhjZWVzc2l2ZS4gIG5hcGkgcG9sbAo+IHdlaWdodCBz
b2x2ZXMgYSBzaW1pbGFyIHByb2JsZW0sIHNvIGl0IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gY2FwIHRo
aXMgYXQKPiBuYXBpX3BvbGxfd2VpZ2h0Lgo+IAo+IFdoaWNoIHdpbGwgYWxsb3cgdHdlYWtpbmcg
aXQgdGhyb3VnaCBhIG1vZHVsZSBwYXJhbWV0ZXIgYXMgYQo+IHNpZGUgZWZmZWN0IDopIE1heWJl
IGp1c3QgZG8gTkFQSV9QT0xMX1dFSUdIVC4KCk9yIG1heWJlIE5BUElfUE9MTF9XRUlHSFQvMiBs
aWtlIHdlIGRvIGF0IGhhbGYgdGhlIHF1ZXVlIDspLiBQbGVhc2UKZXhwZXJpbWVudCwgbWVhc3Vy
ZSBwZXJmb3JtYW5jZSBhbmQgbGV0IHRoZSBsaXN0IGtub3cKCj4gTmVlZCB0byBiZSBjYXJlZnVs
IHRob3VnaDogcXVldWVzIGNhbiBhbHNvIGJlIHNtYWxsIGFuZCBJIGRvbid0IHRoaW5rIHdlCj4g
d2FudCB0byBleGNlZWQgcXVldWUgc2l6ZSAvIDIsIG9yIG1heWJlIHF1ZXVlIHNpemUgLSBuYXBp
X3BvbGxfd2VpZ2h0Lgo+IERlZmluaXRlbHkgbXVzdCBub3QgZXhjZWVkIHRoZSBmdWxsIHF1ZXVl
IHNpemUuCj4gCj4gLS0gCj4gTVNUCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
