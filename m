Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 147A82880CE
	for <lists.virtualization@lfdr.de>; Fri,  9 Oct 2020 05:47:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C5387876A3;
	Fri,  9 Oct 2020 03:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6sdAj-VCT8dH; Fri,  9 Oct 2020 03:47:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 23CAF8769E;
	Fri,  9 Oct 2020 03:47:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0457AC0051;
	Fri,  9 Oct 2020 03:47:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6F30C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 03:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DB98687425
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 03:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1pZjPZ1I4u2J
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 03:47:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F3CDF87267
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 03:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602215220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ux54JNdDdEVnzLVcdf0BICEoj5Z4IXVy7u4NzlDD89k=;
 b=bp74xLL/4Hifzvm9x//kosmf4/CUjXn1HVFolsqGPivUnfpnMUKAchEwVCztVBELJC6HTw
 5uxCptHn221RPPiS49nTIYMUv7oc5SWfYuF6c+Z1C2sM+pDCe3FZmvsRMuud7UYOLtRUAB
 7xIqAc8Y6H12C3M+svJUkiBW0yBUnvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-CF7VmrsZN8Kp6ziGbLQnNw-1; Thu, 08 Oct 2020 23:46:59 -0400
X-MC-Unique: CF7VmrsZN8Kp6ziGbLQnNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8679884A61F;
 Fri,  9 Oct 2020 03:46:57 +0000 (UTC)
Received: from [10.72.13.133] (ovpn-13-133.pek2.redhat.com [10.72.13.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 534906EF63;
 Fri,  9 Oct 2020 03:46:30 +0000 (UTC)
Subject: Re: [RFC PATCH 06/24] vhost-vdpa: switch to use vhost-vdpa specific
 IOTLB
To: Eli Cohen <elic@nvidia.com>
References: <20200924032125.18619-1-jasowang@redhat.com>
 <20200924032125.18619-7-jasowang@redhat.com>
 <20200930120202.GA229518@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <766420cf-09bc-fb3d-f83b-140f99bfc6e3@redhat.com>
Date: Fri, 9 Oct 2020 11:46:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930120202.GA229518@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: lulu@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, mhabets@solarflare.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, stefanha@redhat.com, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvOS8zMCDkuIvljYg4OjAyLCBFbGkgQ29oZW4gd3JvdGU6Cj4gT24gVGh1LCBTZXAg
MjQsIDIwMjAgYXQgMTE6MjE6MDdBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gVG8gZWFz
ZSB0aGUgaW1wbGVtZW50YXRpb24gb2YgcGVyIGdyb3VwIEFTSUQgc3VwcG9ydCBmb3IgdkRQQQo+
PiBkZXZpY2UuIFRoaXMgcGF0Y2ggc3dpdGNoZXMgdG8gdXNlIGEgdmhvc3QtdmRwYSBzcGVjaWZp
YyBJT1RMQiB0bwo+PiBhdm9pZCB0aGUgdW5uZWNlc3NhcnkgcmVmYWN0b3Jpbmcgb2YgdGhlIHZo
b3N0IGNvcmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvdmhvc3QvdmRwYS5jIHwgMTQgKysrKysrKystLS0t
LS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92ZHBhLmMgYi9kcml2ZXJzL3Zob3N0L3Zk
cGEuYwo+PiBpbmRleCA3NGJlZjFjMTVhNzAuLmVjM2M5NGY3MDZjMSAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy92aG9zdC92ZHBhLmMKPj4gKysrIGIvZHJpdmVycy92aG9zdC92ZHBhLmMKPj4gQEAg
LTQwLDYgKzQwLDcgQEAgc3RydWN0IHZob3N0X3ZkcGEgewo+PiAgIAlzdHJ1Y3Qgdmhvc3Rfdmly
dHF1ZXVlICp2cXM7Cj4+ICAgCXN0cnVjdCBjb21wbGV0aW9uIGNvbXBsZXRpb247Cj4+ICAgCXN0
cnVjdCB2ZHBhX2RldmljZSAqdmRwYTsKPj4gKwlzdHJ1Y3Qgdmhvc3RfaW90bGIgKmlvdGxiOwo+
PiAgIAlzdHJ1Y3QgZGV2aWNlIGRldjsKPj4gICAJc3RydWN0IGNkZXYgY2RldjsKPj4gICAJYXRv
bWljX3Qgb3BlbmVkOwo+PiBAQCAtNTE0LDEyICs1MTUsMTEgQEAgc3RhdGljIHZvaWQgdmhvc3Rf
dmRwYV9pb3RsYl91bm1hcChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwKPj4gICAKPj4gICBzdGF0aWMg
dm9pZCB2aG9zdF92ZHBhX2lvdGxiX2ZyZWUoc3RydWN0IHZob3N0X3ZkcGEgKnYpCj4+ICAgewo+
PiAtCXN0cnVjdCB2aG9zdF9kZXYgKmRldiA9ICZ2LT52ZGV2Owo+PiAtCXN0cnVjdCB2aG9zdF9p
b3RsYiAqaW90bGIgPSBkZXYtPmlvdGxiOwo+PiArCXN0cnVjdCB2aG9zdF9pb3RsYiAqaW90bGIg
PSB2LT5pb3RsYjsKPj4gICAKPj4gICAJdmhvc3RfdmRwYV9pb3RsYl91bm1hcCh2LCBpb3RsYiwg
MFVMTCwgMFVMTCAtIDEpOwo+PiAtCWtmcmVlKGRldi0+aW90bGIpOwo+PiAtCWRldi0+aW90bGIg
PSBOVUxMOwo+PiArCWtmcmVlKHYtPmlvdGxiKTsKPj4gKwl2LT5pb3RsYiA9IE5VTEw7Cj4+ICAg
fQo+PiAgIAo+PiAgIHN0YXRpYyBpbnQgcGVybV90b19pb21tdV9mbGFncyh1MzIgcGVybSkKPj4g
QEAgLTY4MSw3ICs2ODEsNyBAQCBzdGF0aWMgaW50IHZob3N0X3ZkcGFfcHJvY2Vzc19pb3RsYl9t
c2coc3RydWN0IHZob3N0X2RldiAqZGV2LAo+PiAgIAlzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiA9IGNv
bnRhaW5lcl9vZihkZXYsIHN0cnVjdCB2aG9zdF92ZHBhLCB2ZGV2KTsKPj4gICAJc3RydWN0IHZk
cGFfZGV2aWNlICp2ZHBhID0gdi0+dmRwYTsKPj4gICAJY29uc3Qgc3RydWN0IHZkcGFfY29uZmln
X29wcyAqb3BzID0gdmRwYS0+Y29uZmlnOwo+PiAtCXN0cnVjdCB2aG9zdF9pb3RsYiAqaW90bGIg
PSBkZXYtPmlvdGxiOwo+PiArCXN0cnVjdCB2aG9zdF9pb3RsYiAqaW90bGIgPSB2LT5pb3RsYjsK
Pj4gICAJaW50IHIgPSAwOwo+PiAgIAo+PiAgIAlyID0gdmhvc3RfZGV2X2NoZWNrX293bmVyKGRl
dik7Cj4+IEBAIC04MTIsMTIgKzgxMiwxNCBAQCBzdGF0aWMgaW50IHZob3N0X3ZkcGFfb3Blbihz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZXApCj4+ICAgCj4+ICAgCXIgPSB2
aG9zdF92ZHBhX2FsbG9jX2RvbWFpbih2KTsKPj4gICAJaWYgKHIpCj4+IC0JCWdvdG8gZXJyX2lu
aXRfaW90bGI7Cj4+ICsJCWdvdG8gZXJyX2FsbG9jX2RvbWFpbjsKPiBZb3UncmUgc3RpbGwgdXNp
bmcgdGhpczoKPiBkZXYtPmlvdGxiID0gdmhvc3RfaW90bGJfYWxsb2MoMCwgMCk7Cj4KPiBTaG91
bGRuJ3QgeW91IHVzZQo+IHYtPmlvdGxiID0gaG9zdF9pb3RsYl9hbGxvYygwLCAwKTsKPgo+IHRv
IHNldCB0aGUgdmRwYSBkZXZpY2UgaW90bGIgZmllbGQ/CgoKWWVzLCB5b3UncmUgcmlnaHQuCgpX
aWxsIGZpeC4KClRoYW5rcwoKCj4KPj4gICAKPj4gICAJZmlsZXAtPnByaXZhdGVfZGF0YSA9IHY7
Cj4+ICAgCj4+ICAgCXJldHVybiAwOwo+PiAgIAo+PiArZXJyX2FsbG9jX2RvbWFpbjoKPj4gKwl2
aG9zdF92ZHBhX2lvdGxiX2ZyZWUodik7Cj4+ICAgZXJyX2luaXRfaW90bGI6Cj4+ICAgCXZob3N0
X3ZkcGFfY2xlYW51cCh2KTsKPj4gICBlcnI6Cj4+IC0tIAo+PiAyLjIwLjEKPj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
