Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C62FC210D2F
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 16:10:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7940389333;
	Wed,  1 Jul 2020 14:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDMYYouxJp_p; Wed,  1 Jul 2020 14:10:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E1D587111;
	Wed,  1 Jul 2020 14:10:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C107C0733;
	Wed,  1 Jul 2020 14:10:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87E18C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 14:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7119D2F0E6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 14:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxrgjAiJKm2o
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 14:10:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 7EB112ED43
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593612631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khW6d9Ym4bkQrcnO5y03gt6SBZFm61i7mNPGes2rY08=;
 b=RQ0i4X27T1Jl8g4Y27jdkmm/nIpTLHp/1rMNj6vVd5bF3y5TEbT6SzKVBVhmO9sgHLDbcD
 nk37e747j88qZbVHL+O6SFKyYriOcUuWo2mf2gDaPqGP7xedkMw1EomZGgnLAeHIwBhac7
 L1TdTI4VtwiRL7eSXEQd1/VS3qmN6X8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-75JDQkjAMjuLA30dqQbpWg-1; Wed, 01 Jul 2020 10:10:12 -0400
X-MC-Unique: 75JDQkjAMjuLA30dqQbpWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 324DA8015CE;
 Wed,  1 Jul 2020 14:10:11 +0000 (UTC)
Received: from [10.72.12.71] (ovpn-12-71.pek2.redhat.com [10.72.12.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BE105C1C5;
 Wed,  1 Jul 2020 14:09:55 +0000 (UTC)
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20200611113404.17810-1-mst@redhat.com>
 <20200611113404.17810-3-mst@redhat.com>
 <20200611152257.GA1798@char.us.oracle.com>
 <CAJaqyWdwXMX0JGhmz6soH2ZLNdaH6HEdpBM8ozZzX9WUu8jGoQ@mail.gmail.com>
 <CAJaqyWdwgy0fmReOgLfL4dAv-E+5k_7z3d9M+vHqt0aO2SmOFg@mail.gmail.com>
 <20200622114622-mutt-send-email-mst@kernel.org>
 <CAJaqyWfrf94Gc-DMaXO+f=xC8eD3DVCD9i+x1dOm5W2vUwOcGQ@mail.gmail.com>
 <20200622122546-mutt-send-email-mst@kernel.org>
 <CAJaqyWfbouY4kEXkc6sYsbdCAEk0UNsS5xjqEdHTD7bcTn40Ow@mail.gmail.com>
 <CAJaqyWefMHPguj8ZGCuccTn0uyKxF9ZTEi2ASLtDSjGNb1Vwsg@mail.gmail.com>
 <419cc689-adae-7ba4-fe22-577b3986688c@redhat.com>
 <CAJaqyWedEg9TBkH1MxGP1AecYHD-e-=ugJ6XUN+CWb=rQGf49g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0a83aa03-8e3c-1271-82f5-4c07931edea3@redhat.com>
Date: Wed, 1 Jul 2020 22:09:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWedEg9TBkH1MxGP1AecYHD-e-=ugJ6XUN+CWb=rQGf49g@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: kvm list <kvm@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, netdev@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
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

Ck9uIDIwMjAvNy8xIOS4i+WNiDk6MDQsIEV1Z2VuaW8gUGVyZXogTWFydGluIHdyb3RlOgo+IE9u
IFdlZCwgSnVsIDEsIDIwMjAgYXQgMjo0MCBQTSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQu
Y29tPiB3cm90ZToKPj4KPj4gT24gMjAyMC83LzEg5LiL5Y2INjo0MywgRXVnZW5pbyBQZXJleiBN
YXJ0aW4gd3JvdGU6Cj4+PiBPbiBUdWUsIEp1biAyMywgMjAyMCBhdCA2OjE1IFBNIEV1Z2VuaW8g
UGVyZXogTWFydGluCj4+PiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pj4gT24gTW9u
LCBKdW4gMjIsIDIwMjAgYXQgNjoyOSBQTSBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQu
Y29tPiB3cm90ZToKPj4+Pj4gT24gTW9uLCBKdW4gMjIsIDIwMjAgYXQgMDY6MTE6MjFQTSArMDIw
MCwgRXVnZW5pbyBQZXJleiBNYXJ0aW4gd3JvdGU6Cj4+Pj4+PiBPbiBNb24sIEp1biAyMiwgMjAy
MCBhdCA1OjU1IFBNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOgo+
Pj4+Pj4+IE9uIEZyaSwgSnVuIDE5LCAyMDIwIGF0IDA4OjA3OjU3UE0gKzAyMDAsIEV1Z2VuaW8g
UGVyZXogTWFydGluIHdyb3RlOgo+Pj4+Pj4+PiBPbiBNb24sIEp1biAxNSwgMjAyMCBhdCAyOjI4
IFBNIEV1Z2VuaW8gUGVyZXogTWFydGluCj4+Pj4+Pj4+IDxlcGVyZXptYUByZWRoYXQuY29tPiB3
cm90ZToKPj4+Pj4+Pj4+IE9uIFRodSwgSnVuIDExLCAyMDIwIGF0IDU6MjIgUE0gS29ucmFkIFJ6
ZXN6dXRlayBXaWxrCj4+Pj4+Pj4+PiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+
Pj4+Pj4+Pj4gT24gVGh1LCBKdW4gMTEsIDIwMjAgYXQgMDc6MzQ6MTlBTSAtMDQwMCwgTWljaGFl
bCBTLiBUc2lya2luIHdyb3RlOgo+Pj4+Pj4+Pj4+PiBBcyB0ZXN0aW5nIHNob3dzIG5vIHBlcmZv
cm1hbmNlIGNoYW5nZSwgc3dpdGNoIHRvIHRoYXQgbm93Lgo+Pj4+Pj4+Pj4+IFdoYXQga2luZCBv
ZiB0ZXN0aW5nPyAxMDBHaUI/IExvdyBsYXRlbmN5Pwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBIaSBL
b25yYWQuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSSB0ZXN0ZWQgdGhpcyB2ZXJzaW9uIG9mIHRoZSBw
YXRjaDoKPj4+Pj4+Pj4+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEwLzEzLzQyCj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4gSXQgd2FzIHRlc3RlZCBmb3IgdGhyb3VnaHB1dCB3aXRoIERQREsncyB0
ZXN0cG1kIChhcyBkZXNjcmliZWQgaW4KPj4+Pj4+Pj4+IGh0dHA6Ly9kb2MuZHBkay5vcmcvZ3Vp
ZGVzL2hvd3RvL3ZpcnRpb191c2VyX2FzX2V4Y2VwdGlvbmFsX3BhdGguaHRtbCkKPj4+Pj4+Pj4+
IGFuZCBrZXJuZWwgcGt0Z2VuLiBObyBsYXRlbmN5IHRlc3RzIHdlcmUgcGVyZm9ybWVkIGJ5IG1l
LiBNYXliZSBpdCBpcwo+Pj4+Pj4+Pj4gaW50ZXJlc3RpbmcgdG8gcGVyZm9ybSBhIGxhdGVuY3kg
dGVzdCBvciBqdXN0IGEgZGlmZmVyZW50IHNldCBvZiB0ZXN0cwo+Pj4+Pj4+Pj4gb3ZlciBhIHJl
Y2VudCB2ZXJzaW9uLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoYW5rcyEKPj4+Pj4+Pj4gSSBoYXZl
IHJlcGVhdGVkIHRoZSB0ZXN0cyB3aXRoIHY5LCBhbmQgcmVzdWx0cyBhcmUgYSBsaXR0bGUgYml0
IGRpZmZlcmVudDoKPj4+Pj4+Pj4gKiBJZiBJIHRlc3Qgb3BlbmluZyBpdCB3aXRoIHRlc3RwbWQs
IEkgc2VlIG5vIGNoYW5nZSBiZXR3ZWVuIHZlcnNpb25zCj4+Pj4+Pj4gT0sgdGhhdCBpcyB0ZXN0
cG1kIG9uIGd1ZXN0LCByaWdodD8gQW5kIHZob3N0LW5ldCBvbiB0aGUgaG9zdD8KPj4+Pj4+Pgo+
Pj4+Pj4gSGkgTWljaGFlbC4KPj4+Pj4+Cj4+Pj4+PiBObywgc29ycnksIGFzIGRlc2NyaWJlZCBp
bgo+Pj4+Pj4gaHR0cDovL2RvYy5kcGRrLm9yZy9ndWlkZXMvaG93dG8vdmlydGlvX3VzZXJfYXNf
ZXhjZXB0aW9uYWxfcGF0aC5odG1sLgo+Pj4+Pj4gQnV0IEkgY291bGQgYWRkIHRvIHRlc3QgaXQg
aW4gdGhlIGd1ZXN0IHRvby4KPj4+Pj4+Cj4+Pj4+PiBUaGVzZSBraW5kcyBvZiByYXcgcGFja2V0
cyAiYnVyc3RzIiBkbyBub3Qgc2hvdyBwZXJmb3JtYW5jZQo+Pj4+Pj4gZGlmZmVyZW5jZXMsIGJ1
dCBJIGNvdWxkIHRlc3QgZGVlcGVyIGlmIHlvdSB0aGluayBpdCB3b3VsZCBiZSB3b3J0aAo+Pj4+
Pj4gaXQuCj4+Pj4+IE9oIG9rLCBzbyB0aGlzIGlzIHdpdGhvdXQgZ3Vlc3QsIHdpdGggdmlydGlv
LXVzZXIuCj4+Pj4+IEl0IG1pZ2h0IGJlIHdvcnRoIGNoZWNraW5nIGRwZGsgd2l0aGluIGd1ZXN0
IHRvbyBqdXN0Cj4+Pj4+IGFzIGFub3RoZXIgZGF0YSBwb2ludC4KPj4+Pj4KPj4+PiBPaywgSSB3
aWxsIGRvIGl0IQo+Pj4+Cj4+Pj4+Pj4+ICogSWYgSSBmb3J3YXJkIHBhY2tldHMgYmV0d2VlbiB0
d28gdmhvc3QtbmV0IGludGVyZmFjZXMgaW4gdGhlIGd1ZXN0Cj4+Pj4+Pj4+IHVzaW5nIGEgbGlu
dXggYnJpZGdlIGluIHRoZSBob3N0Ogo+Pj4+Pj4+IEFuZCBoZXJlIEkgZ3Vlc3MgeW91IG1lYW4g
dmlydGlvLW5ldCBpbiB0aGUgZ3Vlc3Qga2VybmVsPwo+Pj4+Pj4gWWVzLCBzb3JyeTogVHdvIHZp
cnRpby1uZXQgaW50ZXJmYWNlcyBjb25uZWN0ZWQgd2l0aCBhIGxpbnV4IGJyaWRnZSBpbgo+Pj4+
Pj4gdGhlIGhvc3QuIE1vcmUgcHJlY2lzZWx5Ogo+Pj4+Pj4gKiBBZGRpbmcgb25lIG9mIHRoZSBp
bnRlcmZhY2VzIHRvIGFub3RoZXIgbmFtZXNwYWNlLCBhc3NpZ25pbmcgaXQgYW4KPj4+Pj4+IElQ
LCBhbmQgc3RhcnRpbmcgbmV0c2VydmVyIHRoZXJlLgo+Pj4+Pj4gKiBBc3NpZ24gYW5vdGhlciBJ
UCBpbiB0aGUgcmFuZ2UgbWFudWFsbHkgdG8gdGhlIG90aGVyIHZpcnR1YWwgbmV0Cj4+Pj4+PiBp
bnRlcmZhY2UsIGFuZCBzdGFydCB0aGUgZGVzaXJlZCB0ZXN0IHRoZXJlLgo+Pj4+Pj4KPj4+Pj4+
IElmIHlvdSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcGVyZm9ybSB0aGVuIGRpZmZlcmVu
dGx5IHBsZWFzZSBsZXQgbWUga25vdy4KPj4+Pj4gTm90IHN1cmUgd2h5IHlvdSBib3RoZXIgd2l0
aCBuYW1lc3BhY2VzIHNpbmNlIHlvdSBzYWlkIHlvdSBhcmUKPj4+Pj4gdXNpbmcgTDIgYnJpZGdp
bmcuIEkgZ3Vlc3MgaXQncyB1bmltcG9ydGFudC4KPj4+Pj4KPj4+PiBTb3JyeSwgSSB0aGluayBJ
IHNob3VsZCBoYXZlIHByb3ZpZGVkIG1vcmUgY29udGV4dCBhYm91dCB0aGF0Lgo+Pj4+Cj4+Pj4g
VGhlIG9ubHkgcmVhc29uIHRvIHVzZSBuYW1lc3BhY2VzIGlzIHRvIGZvcmNlIHRoZSB0cmFmZmlj
IG9mIHRoZXNlCj4+Pj4gbmV0cGVyZiB0ZXN0cyB0byBnbyB0aHJvdWdoIHRoZSBleHRlcm5hbCBi
cmlkZ2UuIFRvIHRlc3QgbmV0cGVyZgo+Pj4+IGRpZmZlcmVudCBwb3NzaWJpbGl0aWVzIHRoYW4g
dGhlIHRlc3RwbWQgKG9yIHBrdGdlbiBvciBvdGhlcnMgImJsYXN0Cj4+Pj4gb2YgZnJhbWVzIHVu
Y29uZGl0aW9uYWxseSIgdGVzdHMpLgo+Pj4+Cj4+Pj4gVGhpcyB3YXksIEkgbWFrZSBzdXJlIHRo
YXQgaXMgdGhlIHNhbWUgdmVyc2lvbiBvZiBldmVyeXRoaW5nIGluIHRoZQo+Pj4+IGd1ZXN0LCBh
bmQgaXMgYSBsaXR0bGUgYml0IGVhc2llciB0byBtYW5hZ2UgY3B1IGFmZmluaXR5LCBzdGFydCBh
bmQKPj4+PiBzdG9wIHRlc3RpbmcuLi4KPj4+Pgo+Pj4+IEkgY291bGQgdXNlIGEgZGlmZmVyZW50
IFZNIGZvciBzZW5kaW5nIGFuZCByZWNlaXZpbmcsIGJ1dCBJIGZpbmQgdGhpcwo+Pj4+IHdheSBh
IGZhc3RlciBvbmUgYW5kIGl0IHNob3VsZCBub3QgaW50cm9kdWNlIGEgbG90IG9mIG5vaXNlLiBJ
IGNhbgo+Pj4+IHRlc3Qgd2l0aCB0d28gVk0gaWYgeW91IHRoaW5rIHRoYXQgdGhpcyB1c2Ugb2Yg
bmV0d29yayBuYW1lc3BhY2UKPj4+PiBpbnRyb2R1Y2VzIHRvbyBtdWNoIG5vaXNlLgo+Pj4+Cj4+
Pj4gVGhhbmtzIQo+Pj4+Cj4+Pj4+Pj4+ICAgICAtIG5ldHBlcmYgVURQX1NUUkVBTSBzaG93cyBh
IHBlcmZvcm1hbmNlIGluY3JlYXNlIG9mIDEuOCwgYWxtb3N0Cj4+Pj4+Pj4+IGRvdWJsaW5nIHBl
cmZvcm1hbmNlLiBUaGlzIGdldHMgbG93ZXIgYXMgZnJhbWUgc2l6ZSBpbmNyZWFzZS4KPj4+IFJl
Z2FyZGluZyBVRFBfU1RSRUFNOgo+Pj4gKiB3aXRoIGV2ZW50X2lkeD1vbjogVGhlIHBlcmZvcm1h
bmNlIGRpZmZlcmVuY2UgaXMgcmVkdWNlZCBhIGxvdCBpZgo+Pj4gYXBwbGllZCBhZmZpbml0eSBw
cm9wZXJseSAobWFudWFsbHkgYXNzaWduaW5nIENQVSBvbiBob3N0L2d1ZXN0IGFuZAo+Pj4gc2V0
dGluZyBJUlFzIG9uIGd1ZXN0KSwgbWFraW5nIHRoZW0gcGVyZm9ybSBlcXVhbGx5IHdpdGggYW5k
IHdpdGhvdXQKPj4+IHRoZSBwYXRjaCBhZ2Fpbi4gTWF5YmUgdGhlIGJhdGNoaW5nIG1ha2VzIHRo
ZSBzY2hlZHVsZXIgcGVyZm9ybQo+Pj4gYmV0dGVyLgo+Pgo+PiBOb3RlIHRoYXQgZm9yIFVEUF9T
VFJFQU0sIHRoZSByZXN1bHQgaXMgcHJldHR5IHRyaWNrIHRvIGJlIGFuYWx5emVkLiBFLmcKPj4g
c2V0dGluZyBhIHNuZGJ1ZiBmb3IgVEFQIG1heSBoZWxwIGZvciB0aGUgcGVyZm9ybWFuY2UgKHJl
ZHVjZSB0aGUgZHJvcCkuCj4+Cj4gT2ssIHdpbGwgYWRkIHRoYXQgdG8gdGhlIHRlc3QuIFRoYW5r
cyEKCgpBY3R1YWxseSwgaXQncyBiZXR0ZXIgdG8gc2tpcCB0aGUgVURQX1NUUkVBTSB0ZXN0IHNp
bmNlOgoKLSBNeSB1bmRlcnN0YW5kaW5nIGlzIHZlcnkgZmV3IGFwcGxpY2F0aW9uIGlzIHVzaW5n
IHJhdyBVRFAgc3RyZWFtCi0gSXQncyBoYXJkIHRvIGFuYWx5emUgKHVzdWFsbHkgeW91IG5lZWQg
dG8gY291bnQgdGhlIGRyb3AgcmF0aW8gZXRjKQoKCj4KPj4+Pj4+Pj4gICAgIC0gcmVzdHMgb2Yg
dGhlIHRlc3QgZ29lcyBub3RpY2VhYmx5IHdvcnNlOiBVRFBfUlIgZ29lcyBmcm9tIH42MzQ3Cj4+
Pj4+Pj4+IHRyYW5zYWN0aW9ucy9zZWMgdG8gNTgzMAo+Pj4gKiBSZWdhcmRpbmcgVURQX1JSLCBU
Q1BfU1RSRUFNLCBhbmQgVENQX1JSLCBwcm9wZXIgQ1BVIHBpbm5pbmcgbWFrZXMKPj4+IHRoZW0g
cGVyZm9ybSBzaW1pbGFybHkgYWdhaW4sIG9ubHkgYSB2ZXJ5IHNtYWxsIHBlcmZvcm1hbmNlIGRy
b3AKPj4+IG9ic2VydmVkLiBJdCBjb3VsZCBiZSBqdXN0IG5vaXNlLgo+Pj4gKiogQWxsIG9mIHRo
ZW0gcGVyZm9ybSBiZXR0ZXIgdGhhbiB2YW5pbGxhIGlmIGV2ZW50X2lkeD1vZmYsIG5vdCBzdXJl
Cj4+PiB3aHkuIEkgY2FuIHRyeSB0byByZXBlYXQgdGhlbSBpZiB5b3Ugc3VzcGVjdCB0aGF0IGNh
biBiZSBhIHRlc3QKPj4+IGZhaWx1cmUuCj4+Pgo+Pj4gKiBXaXRoIHRlc3RwbWQgYW5kIGV2ZW50
X2lkeD1vZmYsIGlmIEkgc2VuZCBmcm9tIHRoZSBWTSB0byBob3N0LCBJIHNlZQo+Pj4gYSBwZXJm
b3JtYW5jZSBpbmNyZW1lbnQgZXNwZWNpYWxseSBpbiBzbWFsbCBwYWNrZXRzLiBUaGUgYnVmIGFw
aSBhbHNvCj4+PiBpbmNyZWFzZXMgcGVyZm9ybWFuY2UgY29tcGFyZWQgd2l0aCBvbmx5IGJhdGNo
aW5nOiBTZW5kaW5nIHRoZSBtaW5pbXVtCj4+PiBwYWNrZXQgc2l6ZSBpbiB0ZXN0cG1kIG1ha2Vz
IHBwcyBnbyBmcm9tIDM1NmtwcHMgdG8gNDczIGtwcHMuCj4+Cj4+IFdoYXQncyB5b3VyIHNldHVw
IGZvciB0aGlzLiBUaGUgbnVtYmVyIGxvb2tzIHJhdGhlciBsb3cuIEknZCBleHBlY3RlZAo+PiAx
LTIgTXBwcyBhdCBsZWFzdC4KPj4KPiBJbnRlbChSKSBYZW9uKFIpIENQVSBFNS0yNjUwIHY0IEAg
Mi4yMEdIeiwgMiBOVU1BIG5vZGVzIG9mIDE2RyBtZW1vcnkKPiBlYWNoLCBhbmQgbm8gZGV2aWNl
IGFzc2lnbmVkIHRvIHRoZSBOVU1BIG5vZGUgSSdtIHRlc3RpbmcgaW4uIFRvbyBsb3cKPiBmb3Ig
dGVzdHBtZCBBRl9QQUNLRVQgZHJpdmVyIHRvbz8KCgpJIGRvbid0IHRlc3QgQUZfUEFDS0VULCBJ
IGd1ZXNzIGl0IHNob3VsZCB1c2UgdGhlIFYzIHdoaWNoIG1tYXAgYmFzZWQgCnplcm9jb3B5IGlu
dGVyZmFjZS4KCkFuZCBpdCBtaWdodCB3b3J0aCB0byBjaGVjayB0aGUgY3B1IHV0aWxpemF0aW9u
IG9mIHZob3N0IHRocmVhZC4gSXQncyAKcmVxdWlyZWQgdG8gc3RyZXNzIGl0IGFzIDEwMCUgb3Ro
ZXJ3aXNlIHRoZXJlIGNvdWxkIGJlIGEgYm90dGxlbmVjayAKc29tZXdoZXJlLgoKCj4KPj4+IFNl
bmRpbmcKPj4+IDEwMjQgbGVuZ3RoIFVEUC1QRFUgbWFrZXMgaXQgZ28gZnJvbSA1NzBrcHBzIHRv
IDY0IGtwcHMuCj4+Pgo+Pj4gU29tZXRoaW5nIHN0cmFuZ2UgSSBvYnNlcnZlIGluIHRoZXNlIHRl
c3RzOiBJIGdldCBtb3JlIHBwcyB0aGUgYmlnZ2VyCj4+PiB0aGUgdHJhbnNtaXR0ZWQgYnVmZmVy
IHNpemUgaXMuIE5vdCBzdXJlIHdoeS4KPj4+Cj4+PiAqKiBTZW5kaW5nIGZyb20gdGhlIGhvc3Qg
dG8gdGhlIFZNIGRvZXMgbm90IG1ha2UgYSBiaWcgY2hhbmdlIHdpdGggdGhlCj4+PiBwYXRjaGVz
IGluIHNtYWxsIHBhY2tldHMgc2NlbmFyaW8gKG1pbmltdW0sIDY0IGJ5dGVzLCBhYm91dCA2NDUK
Pj4+IHdpdGhvdXQgdGhlIHBhdGNoLCB+NjI1IHdpdGggYmF0Y2ggYW5kIGJhdGNoK2J1ZiBhcGkp
LiBJZiB0aGUgcGFja2V0cwo+Pj4gYXJlIGJpZ2dlciwgSSBjYW4gc2VlIGEgcGVyZm9ybWFuY2Ug
aW5jcmVhc2U6IHdpdGggMjU2IGJpdHMsCj4+Cj4+IEkgdGhpbmsgeW91IG1lYW50IGJ5dGVzPwo+
Pgo+IFllcywgc29ycnkuCj4KPj4+ICAgIGl0IGdvZXMKPj4+IGZyb20gNTkwa3BwcyB0byBhYm91
dCA2MDBrcHBzLCBhbmQgaW4gY2FzZSBvZiAxNTAwIGJ5dGVzIHBheWxvYWQgaXQKPj4+IGdldHMg
ZnJvbSAzNDhrcHBzIHRvIDUyOGtwcHMsIHNvIGl0IGlzIGNsZWFybHkgYW4gaW1wcm92ZW1lbnQu
Cj4+Pgo+Pj4gKiB3aXRoIHRlc3RwbWQgYW5kIGV2ZW50X2lkeD1vbiwgYmF0Y2hpbmcrYnVmIGFw
aSBwZXJmb3JtIHNpbWlsYXJseSBpbgo+Pj4gYm90aCBkaXJlY3Rpb25zLgo+Pj4KPj4+IEFsbCBv
ZiB0ZXN0cG1kIHRlc3RzIHdlcmUgcGVyZm9ybWVkIHdpdGggbm8gbGludXggYnJpZGdlLCBqdXN0
IGEKPj4+IGhvc3QncyB0YXAgaW50ZXJmYWNlICg8aW50ZXJmYWNlIHR5cGU9J2V0aGVybmV0Jz4g
aW4geG1sKSwKPj4KPj4gV2hhdCBEUERLIGRyaXZlciBkaWQgeW91IHVzZSBpbiB0aGUgdGVzdCAo
QUZfUEFDS0VUPykuCj4+Cj4gWWVzLCBib3RoIHRlc3RwbWQgYXJlIHVzaW5nIEFGX1BBQ0tFVCBk
cml2ZXIuCgoKSSBzZWUsIHVzaW5nIEFGX1BBQ0tFVCBtZWFucyBleHRyYSBsYXllcnMgb2YgaXNz
dWVzIG5lZWQgdG8gYmUgYW5hbHl6ZWQgCndoaWNoIGlzIHByb2JhYmx5IG5vdCBnb29kLgoKCj4K
Pj4+IHdpdGggYQo+Pj4gdGVzdHBtZCB0eG9ubHkgYW5kIGFub3RoZXIgaW4gcnhvbmx5IGZvcndh
cmQgbW9kZSwgYW5kIHVzaW5nIHRoZQo+Pj4gcmVjZWl2aW5nIHNpZGUgcGFja2V0cy9ieXRlcyBk
YXRhLiBHdWVzdCdzIHJwcywgeHBzIGFuZCBpbnRlcnJ1cHRzLAo+Pj4gYW5kIGhvc3QncyB2aG9z
dCB0aHJlYWRzIGFmZmluaXR5IHdlcmUgYWxzbyB0dW5lZCBpbiBlYWNoIHRlc3QgdG8KPj4+IHNj
aGVkdWxlIGJvdGggdGVzdHBtZCBhbmQgdmhvc3QgaW4gZGlmZmVyZW50IHByb2Nlc3NvcnMuCj4+
Cj4+IE15IGZlZWxpbmcgaXMgdGhhdCBpZiB3ZSBzdGFydCBmcm9tIHNpbXBsZSBzZXR1cCwgaXQg
d291bGQgYmUgbW9yZQo+PiBlYXNpZXIgYXMgYSBzdGFydC4gRS5nIHN0YXJ0IHdpdGhvdXQgYW4g
Vk0uCj4+Cj4+IDEpIFRYOiB0ZXN0cG1kKHR4b25seSkgLT4gdmlydGlvLXVzZXIgLT4gdmhvc3Rf
bmV0IC0+IFhEUF9EUk9QIG9uIFRBUAo+PiAyKSBSWDogcGtnZXRuIC0+IFRBUCAtPiB2aG9zdF9u
ZXQgLT4gdGVzdHBtZChyeG9ubHkpCj4+Cj4gR290IGl0LiBJcyB0aGVyZSBhIHJlYXNvbiB0byBw
cmVmZXIgcGt0Z2VuIG92ZXIgdGVzdHBtZD8KCgpJIHRoaW5rIHRoZSByZWFzb24gaXMgdXNpbmcg
dGVzdHBtZCB5b3UgbXVzdCB1c2UgYSB1c2Vyc3BhY2Uga2VybmVsIAppbnRlcmZhY2UgKEFGX1BB
Q0tFVCksIGFuZCBpdCBjb3VsZCBub3QgYmUgYXMgZmFzdCBhcyBwa3RnZW4gc2luY2U6CgotIGl0
IHRhbGtzIGRpcmVjdGx5IHRvIHhtaXQgb2YgVEFQCi0gc2tiIGNhbiBiZSBjbG9uZWQKClRoYW5r
cwoKCj4KPj4gVGhhbmtzCj4+Cj4+Cj4+PiBJIHdpbGwgc2VuZCB0aGUgdjEwIFJGQyB3aXRoIHRo
ZSBzbWFsbCBjaGFuZ2VzIHJlcXVlc3RlZCBieSBTdGVmYW4gYW5kIEphc29uLgo+Pj4KPj4+IFRo
YW5rcyEKPj4+Cj4+Pgo+Pj4KPj4+Cj4+Pgo+Pj4KPj4+Cj4+Pj4+Pj4gT0sgc28gaXQgc2VlbXMg
cGxhdXNpYmxlIHRoYXQgd2Ugc3RpbGwgaGF2ZSBhIGJ1ZyB3aGVyZSBhbiBpbnRlcnJ1cHQKPj4+
Pj4+PiBpcyBkZWxheWVkLiBUaGF0IGlzIHRoZSBtYWluIGRpZmZlcmVuY2UgYmV0d2VlbiBwbWQg
YW5kIHZpcnRpby4KPj4+Pj4+PiBMZXQncyB0cnkgZGlzYWJsaW5nIGV2ZW50IGluZGV4LCBhbmQg
c2VlIHdoYXQgaGFwcGVucyAtIHRoYXQncwo+Pj4+Pj4+IHRoZSB0cmlja2llc3QgcGFydCBvZiBp
bnRlcnJ1cHRzLgo+Pj4+Pj4+Cj4+Pj4+PiBHb3QgaXQsIHdpbGwgZ2V0IGJhY2sgd2l0aCB0aGUg
cmVzdWx0cy4KPj4+Pj4+Cj4+Pj4+PiBUaGFuayB5b3UgdmVyeSBtdWNoIQo+Pj4+Pj4KPj4+Pj4+
Pj4gICAgIC0gVENQX1NUUkVBTSBnb2VzIGZyb20gfjEwLjcgZ2JwcyB0byB+N0dicHMKPj4+Pj4+
Pj4gICAgIC0gVENQX1JSIGZyb20gNjIyMy42NCB0cmFuc2FjdGlvbnMvc2VjIHRvIDU3MzkuNDQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
