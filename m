Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8B91EB5FF
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 08:50:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AE13320768;
	Tue,  2 Jun 2020 06:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yeeHGHkN8h6Y; Tue,  2 Jun 2020 06:49:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5C6FD20766;
	Tue,  2 Jun 2020 06:49:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33C73C016E;
	Tue,  2 Jun 2020 06:49:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D30DBC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 06:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C8618880C7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 06:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BvJalNRgNeS1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 06:49:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CED4087F81
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 06:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591080594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bu0T+XX3zpxmrtUQpa6bWw9hSGRZ91a0waCrW1m0YCc=;
 b=bsFkyKFBFSxbOpAducEx1DO0Ob4weE+BOg+TOShFt0uNu+B2AQ0D1RV+lrNlkZLNlauvxf
 7fbdDv36Gi5zU/HLktPlVco87/m+WKR2ocQ3xLGW8W1EWxdCld5GdYBkP8PNIXJDHnJeRg
 Dt1PoYin6k27tylZIzbRFI0o5xY3Xlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-6RfTK8paN_-AGPhOM4Y3IA-1; Tue, 02 Jun 2020 02:49:51 -0400
X-MC-Unique: 6RfTK8paN_-AGPhOM4Y3IA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85DC064AD8;
 Tue,  2 Jun 2020 06:49:49 +0000 (UTC)
Received: from [10.72.12.102] (ovpn-12-102.pek2.redhat.com [10.72.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27A4F5C1D6;
 Tue,  2 Jun 2020 06:49:40 +0000 (UTC)
Subject: Re: [PATCH 4/6] vhost_vdpa: support doorbell mapping via mmap
To: "Michael S. Tsirkin" <mst@redhat.com>, kbuild test robot <lkp@intel.com>
References: <20200529080303.15449-5-jasowang@redhat.com>
 <202006020308.kLXTHt4n%lkp@intel.com>
 <20200602005007-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bd7dde11-b726-ee08-4e80-71fb784fa549@redhat.com>
Date: Tue, 2 Jun 2020 14:49:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602005007-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: kbuild-all@lists.01.org, lulu@redhat.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
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

Ck9uIDIwMjAvNi8yIOS4i+WNiDEyOjU2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VHVlLCBKdW4gMDIsIDIwMjAgYXQgMDM6MjI6NDlBTSArMDgwMCwga2J1aWxkIHRlc3Qgcm9ib3Qg
d3JvdGU6Cj4+IEhpIEphc29uLAo+Pgo+PiBJIGxvdmUgeW91ciBwYXRjaCEgWWV0IHNvbWV0aGlu
ZyB0byBpbXByb3ZlOgo+Pgo+PiBbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIHZob3N0L2xpbnV4
LW5leHRdCj4+IFthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24gbGludXMvbWFzdGVyIHY1LjcgbmV4
dC0yMDIwMDUyOV0KPj4gW2lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0
IHRyZWUsIHBsZWFzZSBkcm9wIHVzIGEgbm90ZSB0byBoZWxwCj4+IGltcHJvdmUgdGhlIHN5c3Rl
bS4gQlRXLCB3ZSBhbHNvIHN1Z2dlc3QgdG8gdXNlICctLWJhc2UnIG9wdGlvbiB0byBzcGVjaWZ5
IHRoZQo+PiBiYXNlIHRyZWUgaW4gZ2l0IGZvcm1hdC1wYXRjaCwgcGxlYXNlIHNlZWh0dHBzOi8v
c3RhY2tvdmVyZmxvdy5jb20vYS8zNzQwNjk4Ml0KPj4KPj4gdXJsOmh0dHBzOi8vZ2l0aHViLmNv
bS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvSmFzb24tV2FuZy92RFBBLWRvb3JiZWxsLW1hcHBpbmcv
MjAyMDA1MzEtMDcwODM0Cj4+IGJhc2U6aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbXN0L3Zob3N0LmdpdCAgbGludXgtbmV4dAo+PiBjb25maWc6IG02OGst
cmFuZGNvbmZpZy1yMDExLTIwMjAwNjAxIChhdHRhY2hlZCBhcyAuY29uZmlnKQo+PiBjb21waWxl
cjogbTY4ay1saW51eC1nY2MgKEdDQykgOS4zLjAKPj4gcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0x
IGJ1aWxkKToKPj4gICAgICAgICAgd2dldGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNv
bS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAgLU8gfi9iaW4vbWFrZS5j
cm9zcwo+PiAgICAgICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzCj4+ICAgICAgICAgICMg
c2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0byBsaW51eCBidWlsZCB0cmVlCj4+ICAgICAgICAg
IENPTVBJTEVSX0lOU1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWdjYy05LjMuMCBtYWtl
LmNyb3NzIEFSQ0g9bTY4awo+Pgo+PiBJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBm
b2xsb3dpbmcgdGFnIGFzIGFwcHJvcHJpYXRlCj4+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCBy
b2JvdDxsa3BAaW50ZWwuY29tPgo+Pgo+PiBBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBi
eSA+Piwgb2xkIG9uZXMgcHJlZml4ZWQgYnkgPDwpOgo+Pgo+PiBkcml2ZXJzL3Zob3N0L3ZkcGEu
YzogSW4gZnVuY3Rpb24gJ3Zob3N0X3ZkcGFfZmF1bHQnOgo+Pj4+IGRyaXZlcnMvdmhvc3QvdmRw
YS5jOjc1NDoyMjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdwZ3By
b3Rfbm9uY2FjaGVkJyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPj4g
NzU0IHwgIHZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X25vbmNhY2hlZCh2bWEtPnZtX3BhZ2Vf
cHJvdCk7Cj4+IHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgo+Pj4+IGRy
aXZlcnMvdmhvc3QvdmRwYS5jOjc1NDoyMjogZXJyb3I6IGluY29tcGF0aWJsZSB0eXBlcyB3aGVu
IGFzc2lnbmluZyB0byB0eXBlICdwZ3Byb3RfdCcge2FrYSAnc3RydWN0IDxhbm9ueW1vdXM+J30g
ZnJvbSB0eXBlICdpbnQnCj4+IGNjMTogc29tZSB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVy
cm9ycwo+Pgo+PiB2aW0gKy9wZ3Byb3Rfbm9uY2FjaGVkICs3NTQgZHJpdmVycy92aG9zdC92ZHBh
LmMKPj4KPj4gICAgIDc0MgkKPj4gICAgIDc0MwlzdGF0aWMgdm1fZmF1bHRfdCB2aG9zdF92ZHBh
X2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+PiAgICAgNzQ0CXsKPj4gICAgIDc0NQkJc3Ry
dWN0IHZob3N0X3ZkcGEgKnYgPSB2bWYtPnZtYS0+dm1fZmlsZS0+cHJpdmF0ZV9kYXRhOwo+PiAg
ICAgNzQ2CQlzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEgPSB2LT52ZHBhOwo+PiAgICAgNzQ3CQlj
b25zdCBzdHJ1Y3QgdmRwYV9jb25maWdfb3BzICpvcHMgPSB2ZHBhLT5jb25maWc7Cj4+ICAgICA3
NDgJCXN0cnVjdCB2ZHBhX25vdGlmaWNhdGlvbl9hcmVhIG5vdGlmeTsKPj4gICAgIDc0OQkJc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB2bWYtPnZtYTsKPj4gICAgIDc1MAkJdTE2IGluZGV4
ID0gdm1hLT52bV9wZ29mZjsKPj4gICAgIDc1MQkKPj4gICAgIDc1MgkJbm90aWZ5ID0gb3BzLT5n
ZXRfdnFfbm90aWZpY2F0aW9uKHZkcGEsIGluZGV4KTsKPj4gICAgIDc1MwkKPj4gICA+IDc1NAkJ
dm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKHZtYS0+dm1fcGFnZV9wcm90KTsK
Pj4gICAgIDc1NQkJaWYgKHJlbWFwX3Bmbl9yYW5nZSh2bWEsIHZtZi0+YWRkcmVzcyAmIFBBR0Vf
TUFTSywKPj4gICAgIDc1NgkJCQkgICAgbm90aWZ5LmFkZHIgPj4gUEFHRV9TSElGVCwgUEFHRV9T
SVpFLAo+PiAgICAgNzU3CQkJCSAgICB2bWEtPnZtX3BhZ2VfcHJvdCkpCj4+ICAgICA3NTgJCQly
ZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwo+PiAgICAgNzU5CQo+PiAgICAgNzYwCQlyZXR1cm4gVk1f
RkFVTFRfTk9QQUdFOwo+PiAgICAgNzYxCX0KPj4gICAgIDc2MgkKPiBZZXMgd2VsbCwgYWxsIHRo
aXMgcmVtYXBwaW5nIGNsZWFybHkgaGFzIG5vIGNoYW5jZSB0byB3b3JrCj4gb24gc3lzdGVtcyB3
aXRob3V0IENPTkZJR19NTVUuCgoKSXQgbG9va3MgdG8gbWUgbW1hcCBjYW4gd29yayBhY2NvcmRp
bmcgdG8gRG9jdW1lbnRhdGlvbi9ub21tdS1tbWFwLnR4dC4gCkJ1dCBJJ20gbm90IHN1cmUgaXQn
cyB3b3J0aCB0byBib3RoZXIuCgpUaGFua3MKCgo+Cj4KPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
