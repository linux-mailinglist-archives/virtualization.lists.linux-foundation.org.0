Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B423E63C
	for <lists.virtualization@lfdr.de>; Fri,  7 Aug 2020 05:23:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E992424F88;
	Fri,  7 Aug 2020 03:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMExrzvxO0YR; Fri,  7 Aug 2020 03:23:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7D2FD25281;
	Fri,  7 Aug 2020 03:23:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5ADB1C0050;
	Fri,  7 Aug 2020 03:23:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4BC0C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 03:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BC7B6869DE
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 03:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BCGUWnWu3LgI
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 03:23:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 211D685F80
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 03:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596770604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsMi9av5b4p35ahtO8uQIDsEdl3GiG9dvjCH9nlwTHQ=;
 b=bM3GelD+SnEdIXQX4pWBxnSGsv3+DlHYrEUpksp1l6gkBgDmIGRGq6BZq75deznRtHEr5h
 a2b0L0Z5ejBLq2FQl927qvUvf1o8T9dzEIqOfDqk01vlukSmsbMsrCyU//HpK8H8Flq48G
 uE5bMEFedtvORWmbAW08lR48XgJSsH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-OYrdhSukPp-3tbOlaSTw9w-1; Thu, 06 Aug 2020 23:23:22 -0400
X-MC-Unique: OYrdhSukPp-3tbOlaSTw9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59B95106B242;
 Fri,  7 Aug 2020 03:23:20 +0000 (UTC)
Received: from [10.72.13.215] (ovpn-13-215.pek2.redhat.com [10.72.13.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A7575F7D8;
 Fri,  7 Aug 2020 03:23:11 +0000 (UTC)
Subject: Re: [PATCH 1/4] vdpa: introduce config op to get valid iova range
To: "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>
References: <20200617032947.6371-1-jasowang@redhat.com>
 <20200617032947.6371-2-jasowang@redhat.com>
 <20200805085035-mutt-send-email-mst@kernel.org>
 <20200806120354.GA171218@mtl-vdi-166.wap.labs.mlnx>
 <20200806082727-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <20debde5-1f59-8bd4-1978-68e59abefaea@redhat.com>
Date: Fri, 7 Aug 2020 11:23:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806082727-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: shahafs@mellanox.com, lulu@redhat.com, saugatm@xilinx.com,
 mhabets@solarflare.com, vmireyno@marvell.com, linux-kernel@vger.kernel.org,
 gdawar@xilinx.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, hanand@xilinx.com, zhangweining@ruijie.com.cn,
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

Ck9uIDIwMjAvOC82IOS4i+WNiDg6MjksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBU
aHUsIEF1ZyAwNiwgMjAyMCBhdCAwMzowMzo1NVBNICswMzAwLCBFbGkgQ29oZW4gd3JvdGU6Cj4+
IE9uIFdlZCwgQXVnIDA1LCAyMDIwIGF0IDA4OjUxOjU2QU0gLTA0MDAsIE1pY2hhZWwgUy4gVHNp
cmtpbiB3cm90ZToKPj4+IE9uIFdlZCwgSnVuIDE3LCAyMDIwIGF0IDExOjI5OjQ0QU0gKzA4MDAs
IEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2UgYSBjb25maWcgb3Ag
dG8gZ2V0IHZhbGlkIGlvdmEgcmFuZ2UgZnJvbSB0aGUgdkRQQQo+Pj4+IGRldmljZS4KPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4+PiAt
LS0KPj4+PiAgIGluY2x1ZGUvbGludXgvdmRwYS5oIHwgMTQgKysrKysrKysrKysrKysKPj4+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC92ZHBhLmggYi9pbmNsdWRlL2xpbnV4L3ZkcGEuaAo+Pj4+IGluZGV4IDIz
OWRiNzk0MzU3Yy4uYjc2MzNlZDI1MDBjIDEwMDY0NAo+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgv
dmRwYS5oCj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC92ZHBhLmgKPj4+PiBAQCAtNDEsNiArNDEs
MTYgQEAgc3RydWN0IHZkcGFfZGV2aWNlIHsKPj4+PiAgIAl1bnNpZ25lZCBpbnQgaW5kZXg7Cj4+
Pj4gICB9Owo+Pj4+ICAgCj4+Pj4gKy8qKgo+Pj4+ICsgKiB2RFBBIElPVkEgcmFuZ2UgLSB0aGUg
SU9WQSByYW5nZSBzdXBwb3J0IGJ5IHRoZSBkZXZpY2UKPj4+PiArICogQHN0YXJ0OiBzdGFydCBv
ZiB0aGUgSU9WQSByYW5nZQo+Pj4+ICsgKiBAZW5kOiBlbmQgb2YgdGhlIElPVkEgcmFuZ2UKPj4+
PiArICovCj4+Pj4gK3N0cnVjdCB2ZHBhX2lvdmFfcmFuZ2Ugewo+Pj4+ICsJdTY0IHN0YXJ0Owo+
Pj4+ICsJdTY0IGVuZDsKPj4+PiArfTsKPj4+PiArCj4+PiBUaGlzIGlzIGFtYmlndW91cy4gSXMg
ZW5kIGluIHRoZSByYW5nZSBvciBqdXN0IGJlaGluZCBpdD8KPj4+IEhvdyBhYm91dCBmaXJzdC9s
YXN0Pwo+PiBJdCBpcyBjdXN0b21hcnkgaW4gdGhlIGtlcm5lbCB0byB1c2Ugc3RhcnQtZW5kIHdo
ZXJlIGVuZCBjb3JyZXNwb25kcyB0bwo+PiB0aGUgYnl0ZSBmb2xsb3dpbmcgdGhlIGxhc3QgaW4g
dGhlIHJhbmdlLiBTZWUgc3RydWN0IHZtX2FyZWFfc3RydWN0Cj4+IHZtX3N0YXJ0IGFuZCB2bV9l
bmQgZmllbGRzCj4gRXhhY3RseSBteSBwb2ludDoKPgo+IGluY2x1ZGUvbGludXgvbW1fdHlwZXMu
aDogICAgICAgdW5zaWduZWQgbG9uZyB2bV9lbmQ7ICAgICAgICAgICAvKiBUaGUgZmlyc3QgYnl0
ZSBhZnRlciBvdXIgZW5kIGFkZHJlc3MKPgo+IGluIHRoaXMgY2FzZSBKYXNvbiB3YW50cyBpdCB0
byBiZSB0aGUgbGFzdCBieXRlLCBub3Qgb25lIGJlaGluZC4KCgpPaywgSSBzb21laG93IHJlY2Fs
bCB0aGUgcmVhc29uIDopCgpTZWU6CgpzdHJ1Y3QgaW9tbXVfZG9tYWluX2dlb21ldHJ5IHsKIMKg
wqDCoCBkbWFfYWRkcl90IGFwZXJ0dXJlX3N0YXJ0OyAvKiBGaXJzdCBhZGRyZXNzIHRoYXQgY2Fu
IGJlIG1hcHBlZMKgwqDCoCAqLwogwqDCoMKgIGRtYV9hZGRyX3QgYXBlcnR1cmVfZW5kO8KgwqAg
LyogTGFzdCBhZGRyZXNzIHRoYXQgY2FuIGJlIG1hcHBlZMKgwqDCoMKgICovCiDCoMKgwqAgYm9v
bCBmb3JjZV9hcGVydHVyZTvCoMKgwqDCoMKgwqAgLyogRE1BIG9ubHkgYWxsb3dlZCBpbiBtYXBw
YWJsZSByYW5nZT8gKi8KfTsKCgpTbyB3aGF0IEkgcHJvcG9zZWQgaGVyZSBpcyB0byBiZSBjb25z
aXN0ZW50IHdpdGggaXQuCgpUaGFua3MKCgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
