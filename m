Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F214060B
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 10:33:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9B3C4220D6;
	Fri, 17 Jan 2020 09:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZ-H+i5gzole; Fri, 17 Jan 2020 09:33:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 53101220A2;
	Fri, 17 Jan 2020 09:33:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42DD5C077D;
	Fri, 17 Jan 2020 09:33:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5811DC077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4BC9586B05
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwzD2bd1hOKR
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:32:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6EF5B86849
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579253576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjodTc+NxXpXZK3ZFiQXvOKJvfATQRwDI15WnbNFZWs=;
 b=Bun+1DGxMtQJfpxe5pzM5vzfgQLvL0cx4U50Z+73bHnw03xdZlkIvKRGRJTtyL6K4qmSub
 CpUhCBR/GxA0wCRw3mY0rhbvP9YzLUQbDxQizRrnD+vrwelzkqo5JBtPIvniC2YlYA4zOP
 hk2ozEYWusWN18Bg8cTrNqUrU+jsXko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-_HQSAA8RM6efHyvV5nrALA-1; Fri, 17 Jan 2020 04:32:55 -0500
X-MC-Unique: _HQSAA8RM6efHyvV5nrALA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9BDD477;
 Fri, 17 Jan 2020 09:32:52 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD49738B;
 Fri, 17 Jan 2020 09:32:36 +0000 (UTC)
Subject: Re: [PATCH 4/5] virtio: introduce a vDPA based transport
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-5-jasowang@redhat.com>
 <20200116153807.GI20978@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8e8aa4b7-4948-5719-9618-e28daffba1a5@redhat.com>
Date: Fri, 17 Jan 2020 17:32:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200116153807.GI20978@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMS8xNiDkuIvljYgxMTozOCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRo
dSwgSmFuIDE2LCAyMDIwIGF0IDA4OjQyOjMwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fdmRwYS5jIGIvZHJpdmVycy92aXJ0
aW8vdmlydGlvX3ZkcGEuYwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLjg2OTM2ZTVlN2VjMwo+PiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fdmRwYS5j
Cj4+IEBAIC0wLDAgKzEsNDAwIEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5Cj4+ICsvKgo+PiArICogVklSVElPIGJhc2VkIGRyaXZlciBmb3IgdkRQQSBkZXZp
Y2UKPj4gKyAqCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjAsIFJlZCBIYXQuIEFsbCByaWdodHMg
cmVzZXJ2ZWQuCj4+ICsgKiAgICAgQXV0aG9yOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQu
Y29tPgo+PiArICoKPj4gKyAqLwo+PiArCj4+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+PiAr
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+
PiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4K
Pj4gKyNpbmNsdWRlIDxsaW51eC91dWlkLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvdmlydGlvLmg+
Cj4+ICsjaW5jbHVkZSA8bGludXgvdmRwYS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19j
b25maWcuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC92aXJ0aW9fcmluZy5oPgo+PiArCj4+ICsjZGVm
aW5lIE1PRF9WRVJTSU9OICAiMC4xIgo+PiArI2RlZmluZSBNT0RfQVVUSE9SICAgIkphc29uIFdh
bmcgPGphc293YW5nQHJlZGhhdC5jb20+Igo+PiArI2RlZmluZSBNT0RfREVTQyAgICAgInZEUEEg
YnVzIGRyaXZlciBmb3IgdmlydGlvIGRldmljZXMiCj4+ICsjZGVmaW5lIE1PRF9MSUNFTlNFICAi
R1BMIHYyIgo+PiArCj4+ICsjZGVmaW5lIHRvX3ZpcnRpb192ZHBhX2RldmljZShkZXYpIFwKPj4g
Kwljb250YWluZXJfb2YoZGV2LCBzdHJ1Y3QgdmlydGlvX3ZkcGFfZGV2aWNlLCB2ZGV2KQo+IFNo
b3VsZCBiZSBhIHN0YXRpYyBmdW5jdGlvbgoKCk9rLgoKCj4KPj4gK3N0cnVjdCB2aXJ0aW9fdmRw
YV9kZXZpY2Ugewo+PiArCXN0cnVjdCB2aXJ0aW9fZGV2aWNlIHZkZXY7Cj4+ICsJc3RydWN0IHZk
cGFfZGV2aWNlICp2ZHBhOwo+PiArCXU2NCBmZWF0dXJlczsKPj4gKwo+PiArCS8qIFRoZSBsb2Nr
IHRvIHByb3RlY3QgdmlydHF1ZXVlIGxpc3QgKi8KPj4gKwlzcGlubG9ja190IGxvY2s7Cj4+ICsJ
LyogTGlzdCBvZiB2aXJ0aW9fdmRwYV92cV9pbmZvICovCj4+ICsJc3RydWN0IGxpc3RfaGVhZCB2
aXJ0cXVldWVzOwo+PiArfTsKPj4gKwo+PiArc3RydWN0IHZpcnRpb192ZHBhX3ZxX2luZm8gewo+
PiArCS8qIHRoZSBhY3R1YWwgdmlydHF1ZXVlICovCj4+ICsJc3RydWN0IHZpcnRxdWV1ZSAqdnE7
Cj4+ICsKPj4gKwkvKiB0aGUgbGlzdCBub2RlIGZvciB0aGUgdmlydHF1ZXVlcyBsaXN0ICovCj4+
ICsJc3RydWN0IGxpc3RfaGVhZCBub2RlOwo+PiArfTsKPj4gKwo+PiArc3RhdGljIHN0cnVjdCB2
ZHBhX2RldmljZSAqdmRfZ2V0X3ZkcGEoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4+ICt7
Cj4+ICsJc3RydWN0IHZpcnRpb192ZHBhX2RldmljZSAqdmRfZGV2ID0gdG9fdmlydGlvX3ZkcGFf
ZGV2aWNlKHZkZXYpOwo+PiArCXN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSA9IHZkX2Rldi0+dmRw
YTsKPj4gKwo+PiArCXJldHVybiB2ZHBhOwo+IEJpdCBvZiBhIGxvbmcgd2F5IHRvIHNheQo+Cj4g
ICAgcmV0dXJuIHRvX3ZpcnRpb192ZHBhX2RldmljZSh2ZGV2KS0+dmRwYQo+Cj4gPwoKClJpZ2h0
LgoKCj4KPj4gK2Vycl92cToKPj4gKwl2cmluZ19kZWxfdmlydHF1ZXVlKHZxKTsKPj4gK2Vycm9y
X25ld192aXJ0cXVldWU6Cj4+ICsJb3BzLT5zZXRfdnFfcmVhZHkodmRwYSwgaW5kZXgsIDApOwo+
PiArCVdBUk5fT04ob3BzLT5nZXRfdnFfcmVhZHkodmRwYSwgaW5kZXgpKTsKPiBBIHdhcm5fb24g
ZHVyaW5nIGVycm9yIHVud2luZD8gU2tldGNoeSwgZGVzZXJ2ZXMgYSBjb21tZW50IEkgdGhpbmsK
CgpZZXMsIGl0J3MgYSBoaW50IG9mIGJ1ZyBpbiB0aGUgdkRQQSBkcml2ZXIuIFdpbGwgYWRkIGEg
Y29tbWVudC4KCgo+Cj4+ICtzdGF0aWMgdm9pZCB2aXJ0aW9fdmRwYV9yZWxlYXNlX2RldihzdHJ1
Y3QgZGV2aWNlICpfZCkKPj4gK3sKPj4gKwlzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiA9Cj4+
ICsJICAgICAgIGNvbnRhaW5lcl9vZihfZCwgc3RydWN0IHZpcnRpb19kZXZpY2UsIGRldik7Cj4+
ICsJc3RydWN0IHZpcnRpb192ZHBhX2RldmljZSAqdmRfZGV2ID0KPj4gKwkgICAgICAgY29udGFp
bmVyX29mKHZkZXYsIHN0cnVjdCB2aXJ0aW9fdmRwYV9kZXZpY2UsIHZkZXYpOwo+PiArCXN0cnVj
dCB2ZHBhX2RldmljZSAqdmRwYSA9IHZkX2Rldi0+dmRwYTsKPj4gKwo+PiArCWRldm1fa2ZyZWUo
JnZkcGEtPmRldiwgdmRfZGV2KTsKPj4gK30KPiBJdCBpcyB1bnVzdWFsIGZvciB0aGUgcmVsZWFz
ZSBmdW5jdGlvbiB0byBub3QgYmUgb3duZWQgYnkgdGhlCj4gc3Vic3lzdGVtLCB0aHJvdWdoIHRo
ZSBjbGFzcy4KCgpUaGlzIGlzIGhvdyB2aXJ0aW9fcGNpIGFuZCB2aXJ0aW9fbW1pbyB3b3JrIG5v
dy4gVmlydGlvIGRldmljZXMgbWF5IGhhdmUgCmRpZmZlcmVudCB0cmFuc3BvcnRzIHdoaWNoIHJl
cXVpcmUgZGlmZmVyZW50IHJlbGVhc2UgZnVuY3Rpb25zLiBJIHRoaW5rIAp0aGlzIGlzIHRoZSBy
ZWFzb24gd2h5IHZpcnRpbwoKCj4gSSdtIG5vdCBzdXJlIHRoZXJlIGFyZSBlbm91Z2ggbW9kdWxl
IHJlZgo+IGNvdW50cyB0byBlbnN1cmUgdGhhdCB0aGlzIGZ1bmN0aW9uIGlzIG5vdCB1bmxvYWRl
ZD8KCgpMZXQgbWUgZG91YmxlIGNoZWNrIHRoaXMuCgoKPgo+IFVzdWFsbHkgdG8gbWFrZSB0aGlz
IGFsbCB3b3JrIHNhbmVseSB0aGUgc3Vic3l0ZW0gcHJvdmlkZXMgc29tZQo+IGFsbG9jYXRpb24g
ZnVuY3Rpb24KPgo+ICAgdmRwYV9kZXYgPSB2ZHBhX2FsbG9jX2RldihwYXJlbnQsIG9wcywgc2l6
ZW9mKHN0cnVjdCB2aXJ0aW9fdmRwYV9kZXZpY2UpKQo+ICAgc3RydWN0IHZpcnRpb192ZHBhX2Rl
dmljZSAqcHJpdiA9IHZkcGFfcHJpdih2ZHBhX2RldikKPgo+IFRoZW4gdGhlIHN1YnN5c3RlbSBu
YXR1cmFsbHkgb3ducyBhbGwgdGhlIG1lbW9yeS4KPgo+IE90aGVyd2lzZSBpdCBnZXRzIHRyaWNr
eSB0byBlbnN1cmUgdGhhdCB0aGUgbW9kdWxlIGRvZXNuJ3QgdW5sb2FkCj4gYmVmb3JlIGFsbCB0
aGUga3JlZnMgYXJlIHB1dC4KCgpJIHNlZS4KCgo+Cj4+ICsKPj4gK3N0YXRpYyBpbnQgdmlydGlv
X3ZkcGFfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQo+PiArewo+PiArCXN0cnVjdCB2ZHBhX2Rl
dmljZSAqdmRwYSA9IGRldl90b192ZHBhKGRldik7Cj4gVGhlIHByb2JlIGZ1bmN0aW9uIGZvciBh
IGNsYXNzIHNob3VsZCBhY2NlcHQgdGhlIGNsYXNzZXMgdHlwZSBhbHJlYWR5LAo+IG5vIGNhc3Rp
bmcuCgoKUmlnaHQuCgoKPgo+PiArCWNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgKm9wcyA9
IHZkcGEtPmNvbmZpZzsKPj4gKwlzdHJ1Y3QgdmlydGlvX3ZkcGFfZGV2aWNlICp2ZF9kZXY7Cj4+
ICsJaW50IHJjOwo+PiArCj4+ICsJdmRfZGV2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCp2
ZF9kZXYpLCBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoIXZkX2RldikKPj4gKwkJcmV0dXJuIC1FTk9N
RU07Cj4gVGhpcyBpcyBub3QgcmlnaHQsIHRoZSBzdHJ1Y3QgZGV2aWNlIGxpZmV0aW1lIGlzIGNv
bnRyb2xlZCBieSBhIGtyZWYsCj4gbm90IHZpYSBkZXZtLiBJZiB5b3Ugd2FudCB0byB1c2UgYSBk
ZXZtIHVud2luZCB0aGVuIHRoZSB1bndpbmQgaXMKPiBwdXRfZGV2aWNlLCBub3QgZGV2bV9rZnJl
ZS4KCgpJJ20gbm90IHN1cmUgSSBnZXQgdGhlIHBvaW50IGhlcmUuIFRoZSBsaWZldGltZSBpcyBi
b3VuZCB0byB1bmRlcmx5aW5nIAp2RFBBIGRldmljZSBhbmQgZGV2cmVzIGFsbG93IHRvIGJlIGZy
ZWVkIGJlZm9yZSB0aGUgdnBkYSBkZXZpY2UgaXMgCnJlbGVhc2VkLiBCdXQgSSBhZ3JlZSB1c2lu
ZyBkZXZyZXMgb2YgdW5kZXJseWluZyB2ZHBhIGRldmljZSBsb29rcyB3aXJlZC4KCgo+Cj4gSW4g
dGhpcyBzaW1wbGUgc2l0dWF0aW9uIEkgZG9uJ3Qgc2VlIGEgcmVhc29uIHRvIHVzZSBkZXZtLgo+
Cj4+ICsJdmRfZGV2LT52ZGV2LmRldi5wYXJlbnQgPSAmdmRwYS0+ZGV2Owo+PiArCXZkX2Rldi0+
dmRldi5kZXYucmVsZWFzZSA9IHZpcnRpb192ZHBhX3JlbGVhc2VfZGV2Owo+PiArCXZkX2Rldi0+
dmRldi5jb25maWcgPSAmdmlydGlvX3ZkcGFfY29uZmlnX29wczsKPj4gKwl2ZF9kZXYtPnZkcGEg
PSB2ZHBhOwo+PiArCUlOSVRfTElTVF9IRUFEKCZ2ZF9kZXYtPnZpcnRxdWV1ZXMpOwo+PiArCXNw
aW5fbG9ja19pbml0KCZ2ZF9kZXYtPmxvY2spOwo+PiArCj4+ICsJdmRfZGV2LT52ZGV2LmlkLmRl
dmljZSA9IG9wcy0+Z2V0X2RldmljZV9pZCh2ZHBhKTsKPj4gKwlpZiAodmRfZGV2LT52ZGV2Lmlk
LmRldmljZSA9PSAwKQo+PiArCQlyZXR1cm4gLUVOT0RFVjsKPj4gKwo+PiArCXZkX2Rldi0+dmRl
di5pZC52ZW5kb3IgPSBvcHMtPmdldF92ZW5kb3JfaWQodmRwYSk7Cj4+ICsJcmMgPSByZWdpc3Rl
cl92aXJ0aW9fZGV2aWNlKCZ2ZF9kZXYtPnZkZXYpOwo+PiArCWlmIChyYykKPj4gKwkJcHV0X2Rl
dmljZShkZXYpOwo+IEFuZCBhIHVnbHkgdW53aW5kIGxpa2UgdGhpcyBpcyB3aHkgeW91IHdhbnQg
dG8gaGF2ZSBkZXZpY2VfaW5pdGlhbGl6ZSgpCj4gZXhwb3NlZCB0byB0aGUgZHJpdmVyLAoKCklu
IHRoaXMgY29udGV4dCwgd2hpY2ggImRyaXZlciIgZGlkIHlvdSBtZWFuIGhlcmU/IChOb3RlLCB2
aXJ0aW8tdmRwYSBpcyAKdGhlIGRyaXZlciBmb3IgdkRQQSBidXMgaGVyZSkuCgoKPiAgIHNvIHRo
ZXJlIGlzIGEgY2xlYXIgcGFpcmluZyB0aGF0IGNhbGxpbmcKPiBkZXZpY2VfaW5pdGlhbGl6ZSgp
IG11c3QgYmUgZm9sbG93ZWQgYnkgcHV0X2RldmljZS4gVGhpcyBzaG91bGQgYWxzbwo+IHVzZSB0
aGUgZ290byB1bndpbmQgc3R5bGUKPgo+PiArCWVsc2UKPj4gKwkJZGV2X3NldF9kcnZkYXRhKGRl
diwgdmRfZGV2KTsKPj4gKwo+PiArCXJldHVybiByYzsKPj4gK30KPj4gKwo+PiArc3RhdGljIHZv
aWQgdmlydGlvX3ZkcGFfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKPj4gK3sKPiBSZW1vdmUg
c2hvdWxkIGFsc28gYWxyZWFkeSBhY2NlcHQgdGhlIHJpZ2h0IHR5cGUKCgpZZXMuCgoKPgo+PiAr
CXN0cnVjdCB2aXJ0aW9fdmRwYV9kZXZpY2UgKnZkX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
Owo+PiArCj4+ICsJdW5yZWdpc3Rlcl92aXJ0aW9fZGV2aWNlKCZ2ZF9kZXYtPnZkZXYpOwo+PiAr
fQo+PiArCj4+ICtzdGF0aWMgc3RydWN0IHZkcGFfZHJpdmVyIHZpcnRpb192ZHBhX2RyaXZlciA9
IHsKPj4gKwkuZHJ2ID0gewo+PiArCQkubmFtZQk9ICJ2aXJ0aW9fdmRwYSIsCj4+ICsJfSwKPj4g
KwkucHJvYmUJPSB2aXJ0aW9fdmRwYV9wcm9iZSwKPj4gKwkucmVtb3ZlID0gdmlydGlvX3ZkcGFf
cmVtb3ZlLAo+PiArfTsKPiBTdGlsbCBhIGxpdHRsZSB1bmNsZWFyIG9uIGJpbmRpbmcsIGlzIHRo
aXMgc3VwcG9zZWQgdG8gYmluZCB0byBhbGwKPiB2ZHBhIGRldmljZXM/CgoKWWVzLCBpdCBleHBl
Y3RlZCB0byBkcml2ZSBhbGwgdkRQQSBkZXZpY2VzLgoKCj4KPiBXaGVyZSBpcyB0aGUgdmFyaW91
cyBUSElTX01PRFVMRSdzIEkgZXhwZWN0IHRvIHNlZSBpbiBhIHNjaGVtZSBsaWtlCj4gdGhpcz8K
Pgo+IEFsbCBmdW5jdGlvbiBwb2ludGVycyBtdXN0IGJlIHByb3RlY3RlZCBieSBhIGhlbGQgbW9k
dWxlIHJlZmVyZW5jZQo+IGNvdW50LCBpZSB0aGUgYWJvdmUgcHJvYmUvcmVtb3ZlIGFuZCBhbGwg
dGhlIHBvaW50ZXJzIGluIG9wcy4KCgpXaWxsIGRvdWJsZSBjaGVjaywgc2luY2UgSSBkb24ndCBz
ZWUgdGhpcyBpbiBvdGhlciB2aXJ0aW8gdHJhbnNwb3J0IApkcml2ZXJzIChQQ0kgb3IgTU1JTyku
CgoKPgo+PiArc3RhdGljIGludCBfX2luaXQgdmlydGlvX3ZkcGFfaW5pdCh2b2lkKQo+PiArewo+
PiArCXJldHVybiByZWdpc3Rlcl92ZHBhX2RyaXZlcigmdmlydGlvX3ZkcGFfZHJpdmVyKTsKPj4g
K30KPj4gKwo+PiArc3RhdGljIHZvaWQgX19leGl0IHZpcnRpb192ZHBhX2V4aXQodm9pZCkKPj4g
K3sKPj4gKwl1bnJlZ2lzdGVyX3ZkcGFfZHJpdmVyKCZ2aXJ0aW9fdmRwYV9kcml2ZXIpOwo+PiAr
fQo+PiArCj4+ICttb2R1bGVfaW5pdCh2aXJ0aW9fdmRwYV9pbml0KQo+PiArbW9kdWxlX2V4aXQo
dmlydGlvX3ZkcGFfZXhpdCkKPiBCZXN0IHRvIHByb3ZpZGUgdGhlIHVzdWFsICdtb2R1bGVfcGNp
X2RyaXZlcicgbGlrZSBzY2hlbWUgZm9yIHRoaXMKPiBib2lsZXIgcGxhdGUuCgoKT2suCgoKPgo+
PiArTU9EVUxFX1ZFUlNJT04oTU9EX1ZFUlNJT04pOwo+PiArTU9EVUxFX0xJQ0VOU0UoTU9EX0xJ
Q0VOU0UpOwo+PiArTU9EVUxFX0FVVEhPUihNT0RfQVVUSE9SKTsKPj4gK01PRFVMRV9ERVNDUklQ
VElPTihNT0RfREVTQyk7Cj4gV2h5IHRoZSBpbmRpcmVjdGlvbiB3aXRoIDJuZCBkZWZpbmVzPwoK
CldpbGwgZml4LgoKVGhhbmtzCgoKPgo+IEphc29uCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
