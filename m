Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F7D6CF56
	for <lists.virtualization@lfdr.de>; Thu, 18 Jul 2019 16:01:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1A5561192;
	Thu, 18 Jul 2019 14:01:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DD6D51169
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 14:01:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 94D098B5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 14:01:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5D9730C1E24;
	Thu, 18 Jul 2019 14:01:22 +0000 (UTC)
Received: from [10.72.12.199] (ovpn-12-199.pek2.redhat.com [10.72.12.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E45B61B7F;
	Thu, 18 Jul 2019 14:01:13 +0000 (UTC)
Subject: Re: [PATCH] virtio-net: parameterize min ring num_free for virtio
	receive
To: "Michael S. Tsirkin" <mst@redhat.com>, ? jiang <jiangkidd@hotmail.com>
References: <BYAPR14MB32056583C4963342F5D817C4A6C80@BYAPR14MB3205.namprd14.prod.outlook.com>
	<20190718085836-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bdd30ef5-4f69-8218-eed0-38c6daac42db@redhat.com>
Date: Thu, 18 Jul 2019 22:01:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718085836-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 18 Jul 2019 14:01:24 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"songliubraving@fb.com" <songliubraving@fb.com>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"jiangran.jr@alibaba-inc.com" <jiangran.jr@alibaba-inc.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>, "kafai@fb.com" <kafai@fb.com>,
	"yhs@fb.com" <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvNy8xOCDkuIvljYg5OjA0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBKdWwgMTgsIDIwMTkgYXQgMTI6NTU6NTBQTSArMDAwMCwgPyBqaWFuZyB3cm90ZToKPj4g
VGhpcyBjaGFuZ2UgbWFrZXMgcmluZyBidWZmZXIgcmVjbGFpbSB0aHJlc2hvbGQgbnVtX2ZyZWUg
Y29uZmlndXJhYmxlCj4+IGZvciBiZXR0ZXIgcGVyZm9ybWFuY2UsIHdoaWxlIGl0J3MgaGFyZCBj
b2RlZCBhcyAxLzIgKiBxdWV1ZSBub3cuCj4+IEFjY29yZGluZyB0byBvdXIgdGVzdCB3aXRoIHFl
bXUgKyBkcGRrLCBwYWNrZXQgZHJvcHBpbmcgaGFwcGVucyB3aGVuCj4+IHRoZSBndWVzdCBpcyBu
b3QgYWJsZSB0byBwcm92aWRlIGZyZWUgYnVmZmVyIGluIGF2YWlsIHJpbmcgdGltZWx5Lgo+PiBT
bWFsbGVyIHZhbHVlIG9mIG51bV9mcmVlIGRvZXMgZGVjcmVhc2UgdGhlIG51bWJlciBvZiBwYWNr
ZXQgZHJvcHBpbmcKPj4gZHVyaW5nIG91ciB0ZXN0IGFzIGl0IG1ha2VzIHZpcnRpb19uZXQgcmVj
bGFpbSBidWZmZXIgZWFybGllci4KPj4KPj4gQXQgbGVhc3QsIHdlIHNob3VsZCBsZWF2ZSB0aGUg
dmFsdWUgY2hhbmdlYWJsZSB0byB1c2VyIHdoaWxlIHRoZQo+PiBkZWZhdWx0IHZhbHVlIGFzIDEv
MiAqIHF1ZXVlIGlzIGtlcHQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IGppYW5na2lkZDxqaWFuZ2tp
ZGRAaG90bWFpbC5jb20+Cj4gVGhhdCB3b3VsZCBiZSBvbmUgcmVhc29uLCBidXQgSSBzdXNwZWN0
IGl0J3Mgbm90IHRoZQo+IHRydWUgb25lLiBJZiB5b3UgbmVlZCBtb3JlIGJ1ZmZlciBkdWUgdG8g
aml0dGVyCj4gdGhlbiBqdXN0IGluY3JlYXNlIHRoZSBxdWV1ZSBzaXplLiBXb3VsZCBiZSBjbGVh
bmVyLgo+Cj4KPiBIb3dldmVyIGFyZSB5b3Ugc3VyZSB0aGlzIGlzIHRoZSByZWFzb24gZm9yCj4g
cGFja2V0IGRyb3BzPyBEbyB5b3Ugc2VlIHRoZW0gZHJvcHBlZCBieSBkcGRrCj4gZHVlIHRvIGxh
Y2sgb2Ygc3BhY2UgaW4gdGhlIHJpbmc/IEFzIG9wcG9zZWQgdG8KPiBieSBndWVzdD8KPgo+CgpC
ZXNpZGVzIHRob3NlLCB0aGlzIHBhdGNoIGRlcGVuZHMgb24gdGhlIHVzZXIgdG8gY2hvb3NlIGEg
c3VpdGFibGUgCnRocmVzaG9sZCB3aGljaCBpcyBub3QgZ29vZC4gWW91IG5lZWQgZWl0aGVyIGEg
Z29vZCB2YWx1ZSB3aXRoIApkZW1vbnN0cmF0ZWQgbnVtYmVycyBvciBzb21ldGhpbmcgc21hcnRl
ci4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
