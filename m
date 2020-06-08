Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CF11F11C7
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 05:36:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CEF9C85BFB;
	Mon,  8 Jun 2020 03:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EjiLx3YA0VGR; Mon,  8 Jun 2020 03:36:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8021785BF2;
	Mon,  8 Jun 2020 03:36:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 346C6C016F;
	Mon,  8 Jun 2020 03:36:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46562C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3AF07862BC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NGTh+8AEPrv9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:35:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1792386274
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591587356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+iuslj2NkA9AsSp4gCUbTEgravqmEYd45b4226klfw=;
 b=Tsu6pd/Gp6dY8Cmjamc4HfJ+7XQy62MyrGTIsuJoFywC8+oBk+8hnDoNyVFZsivrsc2sPW
 XDUZngyJIdQUuuqKzIkJs24TB3piO6leRNp9LzqerXBMWr+4YII8lStETM31/Y0rWcPSsE
 RcR+0a/xo/zabAq5aUoRujvLqkEw2YA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-e59_DPlKOFSrX1a8uR0vBA-1; Sun, 07 Jun 2020 23:35:54 -0400
X-MC-Unique: e59_DPlKOFSrX1a8uR0vBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 826D31005512;
 Mon,  8 Jun 2020 03:35:53 +0000 (UTC)
Received: from [10.72.13.71] (ovpn-13-71.pek2.redhat.com [10.72.13.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E73F768AE;
 Mon,  8 Jun 2020 03:35:42 +0000 (UTC)
Subject: Re: [PATCH RFC 03/13] vhost: batching fetches
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-4-mst@redhat.com>
 <3323daa2-19ed-02de-0ff7-ab150f949fff@redhat.com>
 <20200604045830-mutt-send-email-mst@kernel.org>
 <6c2e6cc7-27c5-445b-f252-0356ff8a83f3@redhat.com>
 <20200607095219-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0d791fe6-8fbe-ddcc-07fa-efbd4fac5ea4@redhat.com>
Date: Mon, 8 Jun 2020 11:35:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200607095219-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNi83IOS4i+WNiDk6NTcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBG
cmksIEp1biAwNSwgMjAyMCBhdCAxMTo0MDoxN0FNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzYvNCDkuIvljYg0OjU5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBXZWQsIEp1biAwMywgMjAyMCBhdCAwMzoyNzozOVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+IE9uIDIwMjAvNi8yIOS4i+WNiDk6MDYsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
Pj4+Pj4gV2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQsIG5ldyBhbmQgb2xkIGNvZGUgcGVyZm9ybSBp
ZGVudGljYWxseS4KPj4+Pj4KPj4+Pj4gTG90cyBvZiBleHRyYSBvcHRpbWl6YXRpb25zIGFyZSBu
b3cgcG9zc2libGUsIGUuZy4KPj4+Pj4gd2UgY2FuIGZldGNoIG11bHRpcGxlIGhlYWRzIHdpdGgg
Y29weV9mcm9tL3RvX3VzZXIgbm93Lgo+Pj4+PiBXZSBjYW4gZ2V0IHJpZCBvZiBtYWludGFpbmlu
ZyB0aGUgbG9nIGFycmF5LiAgRXRjIGV0Yy4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBTLiBUc2lya2luPG1zdEByZWRoYXQuY29tPgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBFdWdl
bmlvIFDDqXJlejxlcGVyZXptYUByZWRoYXQuY29tPgo+Pj4+PiBMaW5rOmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyMDA0MDExODMxMTguODMzNC00LWVwZXJlem1hQHJlZGhhdC5jb20KPj4+
Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luPG1zdEByZWRoYXQuY29tPgo+Pj4+
PiAtLS0KPj4+Pj4gICAgIGRyaXZlcnMvdmhvc3QvdGVzdC5jICB8ICAyICstCj4+Pj4+ICAgICBk
cml2ZXJzL3Zob3N0L3Zob3N0LmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tCj4+Pj4+ICAgICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggfCAgNSArKysrLQo+
Pj4+PiAgICAgMyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC90ZXN0LmMgYi9kcml2ZXJz
L3Zob3N0L3Rlc3QuYwo+Pj4+PiBpbmRleCA5YTNhMDkwMDVlMDMuLjAyODA2ZDZmODRlZiAxMDA2
NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy92aG9zdC90ZXN0LmMKPj4+Pj4gKysrIGIvZHJpdmVycy92
aG9zdC90ZXN0LmMKPj4+Pj4gQEAgLTExOSw3ICsxMTksNyBAQCBzdGF0aWMgaW50IHZob3N0X3Rl
c3Rfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZikKPj4+Pj4gICAgIAlk
ZXYgPSAmbi0+ZGV2Owo+Pj4+PiAgICAgCXZxc1tWSE9TVF9URVNUX1ZRXSA9ICZuLT52cXNbVkhP
U1RfVEVTVF9WUV07Cj4+Pj4+ICAgICAJbi0+dnFzW1ZIT1NUX1RFU1RfVlFdLmhhbmRsZV9raWNr
ID0gaGFuZGxlX3ZxX2tpY2s7Cj4+Pj4+IC0Jdmhvc3RfZGV2X2luaXQoZGV2LCB2cXMsIFZIT1NU
X1RFU1RfVlFfTUFYLCBVSU9fTUFYSU9WLAo+Pj4+PiArCXZob3N0X2Rldl9pbml0KGRldiwgdnFz
LCBWSE9TVF9URVNUX1ZRX01BWCwgVUlPX01BWElPViArIDY0LAo+Pj4+PiAgICAgCQkgICAgICAg
VkhPU1RfVEVTVF9QS1RfV0VJR0hULCBWSE9TVF9URVNUX1dFSUdIVCwgTlVMTCk7Cj4+Pj4+ICAg
ICAJZi0+cHJpdmF0ZV9kYXRhID0gbjsKPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qv
dmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+Pj4+PiBpbmRleCA4ZjlhMDcyODI2MjUu
LmFjYTJhNWIwZDA3OCAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4+
Pj4+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+Pj4+PiBAQCAtMjk5LDYgKzI5OSw3IEBA
IHN0YXRpYyB2b2lkIHZob3N0X3ZxX3Jlc2V0KHN0cnVjdCB2aG9zdF9kZXYgKmRldiwKPj4+Pj4g
ICAgIHsKPj4+Pj4gICAgIAl2cS0+bnVtID0gMTsKPj4+Pj4gICAgIAl2cS0+bmRlc2NzID0gMDsK
Pj4+Pj4gKwl2cS0+Zmlyc3RfZGVzYyA9IDA7Cj4+Pj4+ICAgICAJdnEtPmRlc2MgPSBOVUxMOwo+
Pj4+PiAgICAgCXZxLT5hdmFpbCA9IE5VTEw7Cj4+Pj4+ICAgICAJdnEtPnVzZWQgPSBOVUxMOwo+
Pj4+PiBAQCAtMzY3LDYgKzM2OCwxMSBAQCBzdGF0aWMgaW50IHZob3N0X3dvcmtlcih2b2lkICpk
YXRhKQo+Pj4+PiAgICAgCXJldHVybiAwOwo+Pj4+PiAgICAgfQo+Pj4+PiArc3RhdGljIGludCB2
aG9zdF92cV9udW1fYmF0Y2hfZGVzY3Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4+Pj4+
ICt7Cj4+Pj4+ICsJcmV0dXJuIHZxLT5tYXhfZGVzY3MgLSBVSU9fTUFYSU9WOwo+Pj4+PiArfQo+
Pj4+IDEgZGVzY3JpcHRvciBkb2VzIG5vdCBtZWFuIDEgaW92LCBlLmcgdXNlcnNwYWNlIG1heSBw
YXNzIHNldmVyYWwgMSBieXRlCj4+Pj4gbGVuZ3RoIG1lbW9yeSByZWdpb25zIGZvciB1cyB0byB0
cmFuc2xhdGUuCj4+Pj4KPj4+IFllcyBidXQgSSBkb24ndCBzZWUgdGhlIHJlbGV2YW5jZS4gVGhp
cyB0ZWxscyB1cyBob3cgbWFueSBkZXNjcmlwdG9ycyB0bwo+Pj4gYmF0Y2gsIG5vdCBob3cgbWFu
eSBJT1ZzLgo+PiBZZXMsIGJ1dCBxdWVzdGlvbnMgYXJlOgo+Pgo+PiAtIHRoaXMgaW50cm9kdWNl
IGFub3RoZXIgb2JzdGFjbGUgdG8gc3VwcG9ydCBtb3JlIHRoYW4gMUsgcXVldWUgc2l6ZQo+PiAt
IGlmIHdlIHN1cHBvcnQgMUsgcXVldWUgc2l6ZSwgZG9lcyBpdCBtZWFuIHdlIG5lZWQgdG8gY2Fj
aGUgMUsgZGVzY3JpcHRvcnMsCj4+IHdoaWNoIHNlZW1zIGEgbGFyZ2Ugc3RyZXNzIG9uIHRoZSBj
YWNoZQo+Pgo+PiBUaGFua3MKPj4KPj4KPiBTdGlsbCBkb24ndCB1bmRlcnN0YW5kIHRoZSByZWxl
dmFuY2UuIFdlIHN1cHBvcnQgdXAgdG8gMUsgZGVzY3JpcHRvcnMKPiBwZXIgYnVmZmVyIGp1c3Qg
Zm9yIElPViBzaW5jZSB3ZSBhbHdheXMgZGlkLiBUaGlzIGFkZHMgNjQgbW9yZQo+IGRlc2NyaXB0
b3JzIC0gaXMgdGhhdCBhIGJpZyBkZWFsPwoKCklmIEkgdW5kZXJzdGFuZGluZyBjb3JyZWN0bHks
IGZvciBuZXQsIHRoZSBjb2RlIHRyaWVzIHRvIGJhdGNoIApkZXNjcmlwdG9ycyBmb3IgYXQgbGFz
dCBvbmUgcGFja2V0LgoKSWYgd2UgYWxsb3cgMUsgcXVldWUgc2l6ZSB0aGVuIHdlIGFsbG93IGEg
cGFja2V0IHRoYXQgY29uc2lzdHMgb2YgMUsgCmRlc2NyaXB0b3JzLiBUaGVuIHdlIG5lZWQgdG8g
Y2FjaGUgMUsgZGVzY3JpcHRvcnMuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
