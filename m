Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AF983194093
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 14:57:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 572188862D;
	Thu, 26 Mar 2020 13:57:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dHOkvbtjQ5r; Thu, 26 Mar 2020 13:57:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D38B588629;
	Thu, 26 Mar 2020 13:57:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4798C0177;
	Thu, 26 Mar 2020 13:57:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A731C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 13:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2296D88629
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 13:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6bPYi5a-MbZ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 13:57:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0FD0F88625
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585231035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTy9XzunUpSqneSBWA8G2EaCSTiTKP7tCVW6EiON0Oc=;
 b=L2p42bnGJWVElHNvl6AAemYAHywKfbRHCaq07e9DxhgvZame76U+t6/pevNU7Xdrh/8B4+
 7l4Zt2cd2a/SOkeWC1Bn3mlgoLnvw7xCvDQktGva7699/OCeTuwQxF/gR7cvicSUZIYbuc
 LxrYyG/ssooXVqzzLqKsCeFrlB3Jc2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-aLmbfdiSP4iuwWm6Alh4Rw-1; Thu, 26 Mar 2020 09:57:12 -0400
X-MC-Unique: aLmbfdiSP4iuwWm6Alh4Rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82830800D50;
 Thu, 26 Mar 2020 13:57:09 +0000 (UTC)
Received: from [10.72.12.19] (ovpn-12-19.pek2.redhat.com [10.72.12.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFE2E60BF3;
 Thu, 26 Mar 2020 13:56:49 +0000 (UTC)
Subject: Re: [PATCH V8 9/9] virtio: Intel IFC VF driver for VDPA
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200325082711.1107-1-jasowang@redhat.com>
 <20200325082711.1107-10-jasowang@redhat.com>
 <20200325123410.GX13183@mellanox.com>
 <ed04692d-236c-2eee-4429-6ef4d5d165fe@redhat.com>
 <20200326121705.GJ13183@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a03edad7-e1c9-ae2f-5843-d63907289a3f@redhat.com>
Date: Thu, 26 Mar 2020 21:56:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200326121705.GJ13183@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMy8yNiDkuIvljYg4OjE3LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gVGh1
LCBNYXIgMjYsIDIwMjAgYXQgMDE6NTA6NTNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPgo+
Pj4+ICsJYWRhcHRlci0+dmRwYS5kbWFfZGV2ID0gZGV2Owo+Pj4+ICsJcmV0ID0gdmRwYV9yZWdp
c3Rlcl9kZXZpY2UoJmFkYXB0ZXItPnZkcGEpOwo+Pj4+ICsJaWYgKHJldCkgewo+Pj4+ICsJCUlG
Q1ZGX0VSUihhZGFwdGVyLT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgaWZjdmYgdG8gdmRwYSBi
dXMiKTsKPj4+PiArCQlnb3RvIGVycl9tc2l4Owo+Pj4+ICsJfQo+Pj4+ICsKPj4+PiArCXJldHVy
biAwOwo+Pj4+ICsKPj4+PiArZXJyX21zaXg6Cj4+Pj4gKwlwdXRfZGV2aWNlKCZhZGFwdGVyLT52
ZHBhLmRldik7Cj4+Pj4gKwlyZXR1cm4gcmV0Owo+Pj4+ICtlcnJfYWxsb2M6Cj4+Pj4gKwlwY2lf
ZnJlZV9pcnFfdmVjdG9ycyhwZGV2KTsKPj4+PiArZXJyX3ZlY3RvcnM6Cj4+Pj4gKwlwY2lfcmVs
ZWFzZV9yZWdpb25zKHBkZXYpOwo+Pj4+ICtlcnJfcmVnaW9uczoKPj4+PiArCXBjaV9kaXNhYmxl
X2RldmljZShwZGV2KTsKPj4+PiArZXJyX2VuYWJsZToKPj4+PiArCXJldHVybiByZXQ7Cj4+Pj4g
K30KPj4+IEkgcGVyc29uYWxseSBkb24ndCBsaWtlIHNlZWluZyBnb3RvIHVud2luZHMgd2l0aCBt
dWx0aXBsZSByZXR1cm5zLCBhbmQKPj4+IGhlcmUgSSB0aGluayBpdCBpcyBhY3R1YWxseSBhIHRp
bnkgYnVnLgo+Pj4KPj4+IEFsbCB0b3VjaGVzIHRvIHRoZSBQQ0kgZGV2aWNlIG11c3Qgc3RvcCBi
ZWZvcmUgdGhlIGRyaXZlciBjb3JlCj4+PiByZW1vdmUoKSByZXR1cm5zIC0gc28gdGhlc2UgcGNp
IGZ1bmN0aW9uIGNhbm5vdCBiZSBpbiB0aGUga3JlZiBwdXQKPj4+IHJlbGVhc2UgZnVuY3Rpb24g
YW55aG93Lgo+Pgo+PiBJJ20gbm90IHN1cmUgSSBnZXQgaGVyZS4gSUZDVkYgaGVsZCByZWZjbnQg
b2YgaXRzIFBDSSBwYXJlbnQsIHNvIGl0IGxvb2tzIHRvCj4+IG1lIGl0J3Mgc2FmZSB0byBmcmVl
IFBDSSByZXNvdXJjZXMgaW4gdkRQQSBmcmVlIGNhbGxiYWNrPwo+IFRoZSByZWZjbnQgZG9lc24n
dCBwcmV2ZW50IHRoZSBkcml2ZXIgY29yZSBmcm9tIHJlLWJpbmRpbmcgdGhlCj4gcGNpX2Rldmlj
ZSB0byBhbm90aGVyIGRyaXZlci4gVGhlbiB0aGUgcmVmY291bnQgcHV0IHdvdWxkIGRvIGEKPiBw
Y2lfZGlzYWJsZV9kZXZpY2UoKSBhZnRlciBhbm90aGVyIGRyaXZlciBoYXMgc3RhcnRlZAo+Cj4g
Rm9yIHRoaXMgcmVhc29uIGFsbCB0b3VjaGVzIHRvIGEgc3RydWN0IHBjaV9kZXZpY2UgbXVzdCBz
dG9wIGJlZm9yZQo+IHJlbW92ZSByZXR1cm5zLgo+Cj4gSmFzb24KCgpPaywgd2lsbCBzZW5kIGEg
bmV3IHZlcnNpb24gc2hvcnRseS4KClRoYW5rcwoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
