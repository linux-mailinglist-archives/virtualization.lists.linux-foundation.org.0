Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0183561C1
	for <lists.virtualization@lfdr.de>; Wed,  7 Apr 2021 05:08:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5015E40F59;
	Wed,  7 Apr 2021 03:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jjFajImqTHw; Wed,  7 Apr 2021 03:08:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99C5F40F5A;
	Wed,  7 Apr 2021 03:08:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24E14C0012;
	Wed,  7 Apr 2021 03:08:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB9A0C000A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 03:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BD4D40F27
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 03:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovzCL5cxAp5d
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 03:08:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C6D140F20
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 03:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617764914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUOp1bKxUERRwwBuWQa8wR+mqxjnD+zaLCkxmwx1QiM=;
 b=T5a4wmAoeZDMP6XItktTSh19DOLF3LPTtkEgIFY4eqvX2O8Tou7D6KiafglIlCpIdd2g79
 MzXmpjc2oF+W5QZStjaUaGaAL0hQYXBLmV9EmwoFaMsM/mJkpCP/U7nxLjFnen5LhLsrUP
 gfr/Axb0o+pZSl0PyuPnzgF4X2eOulc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-F3rp7jAJNOmF9w5r_x2YCg-1; Tue, 06 Apr 2021 23:08:32 -0400
X-MC-Unique: F3rp7jAJNOmF9w5r_x2YCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49EED8189C7;
 Wed,  7 Apr 2021 03:08:31 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-233.pek2.redhat.com
 [10.72.13.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7DD710023AF;
 Wed,  7 Apr 2021 03:08:24 +0000 (UTC)
Subject: Re: [PATCH linux-next v2 01/14] vdpa: Follow kdoc comment style
To: Parav Pandit <parav@nvidia.com>, virtualization@lists.linux-foundation.org
References: <20210406170457.98481-1-parav@nvidia.com>
 <20210406170457.98481-2-parav@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0af9f61b-02a6-3b28-b101-d9125bd50e35@redhat.com>
Date: Wed, 7 Apr 2021 11:08:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210406170457.98481-2-parav@nvidia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: elic@nvidia.com, mst@redhat.com
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNC83IMnPzucxOjA0LCBQYXJhdiBQYW5kaXQg0LS1wDoKPiBGb2xsb3cgY29tbWVu
dCBzdHlsZSBtZW50aW9uZWQgaW4gdGhlIFdyaXRpbmcga2VybmVsLWRvYyBkb2N1bWVudCBbMV0u
Cj4KPiBGb2xsb3dpbmcgd2FybmluZ3MgYXJlIGZpeGVkLgo+ICQgc2NyaXB0cy9rZXJuZWwtZG9j
IC12IC1ub25lIGluY2x1ZGUvbGludXgvdmRwYS5oCj4gaW5jbHVkZS9saW51eC92ZHBhLmg6MTE6
IHdhcm5pbmc6IG1pc3NpbmcgaW5pdGlhbCBzaG9ydCBkZXNjcmlwdGlvbiBvbiBsaW5lOgo+ICAg
KiB2RFBBIGNhbGxiYWNrIGRlZmluaXRpb24uCj4gaW5jbHVkZS9saW51eC92ZHBhLmg6MTE6IGlu
Zm86IFNjYW5uaW5nIGRvYyBmb3IgdkRQQQo+IGluY2x1ZGUvbGludXgvdmRwYS5oOjE1OiB3YXJu
aW5nOiBjYW5ub3QgdW5kZXJzdGFuZCBmdW5jdGlvbiBwcm90b3R5cGU6ICdzdHJ1Y3QgdmRwYV9j
YWxsYmFjayAnCj4gaW5jbHVkZS9saW51eC92ZHBhLmg6MjE6IHdhcm5pbmc6IG1pc3NpbmcgaW5p
dGlhbCBzaG9ydCBkZXNjcmlwdGlvbiBvbiBsaW5lOgo+ICAgKiB2RFBBIG5vdGlmaWNhdGlvbiBh
cmVhCj4gaW5jbHVkZS9saW51eC92ZHBhLmg6MjE6IGluZm86IFNjYW5uaW5nIGRvYyBmb3IgdkRQ
QQo+IGluY2x1ZGUvbGludXgvdmRwYS5oOjI1OiB3YXJuaW5nOiBjYW5ub3QgdW5kZXJzdGFuZCBm
dW5jdGlvbiBwcm90b3R5cGU6ICdzdHJ1Y3QgdmRwYV9ub3RpZmljYXRpb25fYXJlYSAnCj4gaW5j
bHVkZS9saW51eC92ZHBhLmg6MzE6IHdhcm5pbmc6IG1pc3NpbmcgaW5pdGlhbCBzaG9ydCBkZXNj
cmlwdGlvbiBvbiBsaW5lOgo+ICAgKiB2RFBBIHZxX3N0YXRlIGRlZmluaXRpb24KPiBpbmNsdWRl
L2xpbnV4L3ZkcGEuaDozMTogaW5mbzogU2Nhbm5pbmcgZG9jIGZvciB2RFBBCj4gaW5jbHVkZS9s
aW51eC92ZHBhLmg6MzQ6IHdhcm5pbmc6IGNhbm5vdCB1bmRlcnN0YW5kIGZ1bmN0aW9uIHByb3Rv
dHlwZTogJ3N0cnVjdCB2ZHBhX3ZxX3N0YXRlICcKPiBpbmNsdWRlL2xpbnV4L3ZkcGEuaDo0MTog
aW5mbzogU2Nhbm5pbmcgZG9jIGZvciB2RFBBIGRldmljZQo+IGluY2x1ZGUvbGludXgvdmRwYS5o
OjUxOiB3YXJuaW5nOiBjYW5ub3QgdW5kZXJzdGFuZCBmdW5jdGlvbiBwcm90b3R5cGU6ICdzdHJ1
Y3QgdmRwYV9kZXZpY2UgJwo+IGluY2x1ZGUvbGludXgvdmRwYS5oOjYyOiBpbmZvOiBTY2Fubmlu
ZyBkb2MgZm9yIHZEUEEgSU9WQSByYW5nZQo+IGluY2x1ZGUvbGludXgvdmRwYS5oOjY2OiB3YXJu
aW5nOiBjYW5ub3QgdW5kZXJzdGFuZCBmdW5jdGlvbiBwcm90b3R5cGU6ICdzdHJ1Y3QgdmRwYV9p
b3ZhX3JhbmdlICcKPiBpbmNsdWRlL2xpbnV4L3ZkcGEuaDo3MjogaW5mbzogU2Nhbm5pbmcgZG9j
IGZvciB2RFBBX2NvbmZpZ19vcHMKPiBpbmNsdWRlL2xpbnV4L3ZkcGEuaDoyMDM6IHdhcm5pbmc6
IGNhbm5vdCB1bmRlcnN0YW5kIGZ1bmN0aW9uIHByb3RvdHlwZTogJ3N0cnVjdCB2ZHBhX2NvbmZp
Z19vcHMgJwo+IGluY2x1ZGUvbGludXgvdmRwYS5oOjI3MDogaW5mbzogU2Nhbm5pbmcgZG9jIGZv
ciB2ZHBhX2RyaXZlcgo+IGluY2x1ZGUvbGludXgvdmRwYS5oOjI3NTogd2FybmluZzogY2Fubm90
IHVuZGVyc3RhbmQgZnVuY3Rpb24gcHJvdG90eXBlOiAnc3RydWN0IHZkcGFfZHJpdmVyICcKPiBp
bmNsdWRlL2xpbnV4L3ZkcGEuaDozNDc6IGluZm86IFNjYW5uaW5nIGRvYyBmb3IgdmRwYV9tZ210
ZGV2X29wcwo+IGluY2x1ZGUvbGludXgvdmRwYS5oOjM2MDogd2FybmluZzogY2Fubm90IHVuZGVy
c3RhbmQgZnVuY3Rpb24gcHJvdG90eXBlOiAnc3RydWN0IHZkcGFfbWdtdGRldl9vcHMgJwo+Cj4g
QWZ0ZXIgdGhpcyBmaXg6Cj4KPiBzY3JpcHRzL2tlcm5lbC1kb2MgLXYgLW5vbmUgaW5jbHVkZS9s
aW51eC92ZHBhLmgKPiBpbmNsdWRlL2xpbnV4L3ZkcGEuaDoxMTogaW5mbzogU2Nhbm5pbmcgZG9j
IGZvciBzdHJ1Y3QgdmRwYV9jYWxsbGJhY2sKPiBpbmNsdWRlL2xpbnV4L3ZkcGEuaDoyMTogaW5m
bzogU2Nhbm5pbmcgZG9jIGZvciBzdHJ1Y3QgdmRwYV9ub3RpZmljYXRpb25fYXJlYQo+IGluY2x1
ZGUvbGludXgvdmRwYS5oOjMxOiBpbmZvOiBTY2FubmluZyBkb2MgZm9yIHN0cnVjdCB2ZHBhX3Zx
X3N0YXRlCj4gaW5jbHVkZS9saW51eC92ZHBhLmg6NDE6IGluZm86IFNjYW5uaW5nIGRvYyBmb3Ig
c3RydWN0IHZkcGFfZGV2aWNlCj4gaW5jbHVkZS9saW51eC92ZHBhLmg6NjI6IGluZm86IFNjYW5u
aW5nIGRvYyBmb3Igc3RydWN0IHZkcGFfaW92YV9yYW5nZQo+IGluY2x1ZGUvbGludXgvdmRwYS5o
OjcyOiBpbmZvOiBTY2FubmluZyBkb2MgZm9yIHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMKPiBpbmNs
dWRlL2xpbnV4L3ZkcGEuaDoyNzA6IGluZm86IFNjYW5uaW5nIGRvYyBmb3Igc3RydWN0IHZkcGFf
ZHJpdmVyCj4gaW5jbHVkZS9saW51eC92ZHBhLmg6MzQ3OiBpbmZvOiBTY2FubmluZyBkb2MgZm9y
IHN0cnVjdCB2ZHBhX21nbXRkZXZfb3BzCj4KPiBbMV0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9k
b2MvaHRtbC9sYXRlc3QvZG9jLWd1aWRlL2tlcm5lbC1kb2MuaHRtbAo+Cj4gU2lnbmVkLW9mZi1i
eTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPgo+IFJldmlld2VkLWJ5OiBFbGkgQ29o
ZW4gPGVsaWNAbnZpZGlhLmNvbT4KCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4KCgo+IC0tLQo+ICAgaW5jbHVkZS9saW51eC92ZHBhLmggfCAzOCArKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
dmRwYS5oIGIvaW5jbHVkZS9saW51eC92ZHBhLmgKPiBpbmRleCAxNWZhMDg1ZmFiMDUuLjM3YjY1
Y2E5NDBjZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3ZkcGEuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvdmRwYS5oCj4gQEAgLTgsNyArOCw3IEBACj4gICAjaW5jbHVkZSA8bGludXgvdmhv
c3RfaW90bGIuaD4KPiAgIAo+ICAgLyoqCj4gLSAqIHZEUEEgY2FsbGJhY2sgZGVmaW5pdGlvbi4K
PiArICogc3RydWN0IHZkcGFfY2FsbGxiYWNrIC0gdkRQQSBjYWxsYmFjayBkZWZpbml0aW9uLgo+
ICAgICogQGNhbGxiYWNrOiBpbnRlcnJ1cHQgY2FsbGJhY2sgZnVuY3Rpb24KPiAgICAqIEBwcml2
YXRlOiB0aGUgZGF0YSBwYXNzZWQgdG8gdGhlIGNhbGxiYWNrIGZ1bmN0aW9uCj4gICAgKi8KPiBA
QCAtMTgsNyArMTgsNyBAQCBzdHJ1Y3QgdmRwYV9jYWxsYmFjayB7Cj4gICB9Owo+ICAgCj4gICAv
KioKPiAtICogdkRQQSBub3RpZmljYXRpb24gYXJlYQo+ICsgKiBzdHJ1Y3QgdmRwYV9ub3RpZmlj
YXRpb25fYXJlYSAtIHZEUEEgbm90aWZpY2F0aW9uIGFyZWEKPiAgICAqIEBhZGRyOiBiYXNlIGFk
ZHJlc3Mgb2YgdGhlIG5vdGlmaWNhdGlvbiBhcmVhCj4gICAgKiBAc2l6ZTogc2l6ZSBvZiB0aGUg
bm90aWZpY2F0aW9uIGFyZWEKPiAgICAqLwo+IEBAIC0yOCw3ICsyOCw3IEBAIHN0cnVjdCB2ZHBh
X25vdGlmaWNhdGlvbl9hcmVhIHsKPiAgIH07Cj4gICAKPiAgIC8qKgo+IC0gKiB2RFBBIHZxX3N0
YXRlIGRlZmluaXRpb24KPiArICogc3RydWN0IHZkcGFfdnFfc3RhdGUgLSB2RFBBIHZxX3N0YXRl
IGRlZmluaXRpb24KPiAgICAqIEBhdmFpbF9pbmRleDogYXZhaWxhYmxlIGluZGV4Cj4gICAgKi8K
PiAgIHN0cnVjdCB2ZHBhX3ZxX3N0YXRlIHsKPiBAQCAtMzgsNyArMzgsNyBAQCBzdHJ1Y3QgdmRw
YV92cV9zdGF0ZSB7Cj4gICBzdHJ1Y3QgdmRwYV9tZ210X2RldjsKPiAgIAo+ICAgLyoqCj4gLSAq
IHZEUEEgZGV2aWNlIC0gcmVwcmVzZW50YXRpb24gb2YgYSB2RFBBIGRldmljZQo+ICsgKiBzdHJ1
Y3QgdmRwYV9kZXZpY2UgLSByZXByZXNlbnRhdGlvbiBvZiBhIHZEUEEgZGV2aWNlCj4gICAgKiBA
ZGV2OiB1bmRlcmx5aW5nIGRldmljZQo+ICAgICogQGRtYV9kZXY6IHRoZSBhY3R1YWwgZGV2aWNl
IHRoYXQgaXMgcGVyZm9ybWluZyBETUEKPiAgICAqIEBjb25maWc6IHRoZSBjb25maWd1cmF0aW9u
IG9wcyBmb3IgdGhpcyBkZXZpY2UuCj4gQEAgLTU5LDcgKzU5LDcgQEAgc3RydWN0IHZkcGFfZGV2
aWNlIHsKPiAgIH07Cj4gICAKPiAgIC8qKgo+IC0gKiB2RFBBIElPVkEgcmFuZ2UgLSB0aGUgSU9W
QSByYW5nZSBzdXBwb3J0IGJ5IHRoZSBkZXZpY2UKPiArICogc3RydWN0IHZkcGFfaW92YV9yYW5n
ZSAtIHRoZSBJT1ZBIHJhbmdlIHN1cHBvcnQgYnkgdGhlIGRldmljZQo+ICAgICogQGZpcnN0OiBz
dGFydCBvZiB0aGUgSU9WQSByYW5nZQo+ICAgICogQGxhc3Q6IGVuZCBvZiB0aGUgSU9WQSByYW5n
ZQo+ICAgICovCj4gQEAgLTY5LDcgKzY5LDcgQEAgc3RydWN0IHZkcGFfaW92YV9yYW5nZSB7Cj4g
ICB9Owo+ICAgCj4gICAvKioKPiAtICogdkRQQV9jb25maWdfb3BzIC0gb3BlcmF0aW9ucyBmb3Ig
Y29uZmlndXJpbmcgYSB2RFBBIGRldmljZS4KPiArICogc3RydWN0IHZkcGFfY29uZmlnX29wcyAt
IG9wZXJhdGlvbnMgZm9yIGNvbmZpZ3VyaW5nIGEgdkRQQSBkZXZpY2UuCj4gICAgKiBOb3RlOiB2
RFBBIGRldmljZSBkcml2ZXJzIGFyZSByZXF1aXJlZCB0byBpbXBsZW1lbnQgYWxsIG9mIHRoZQo+
ICAgICogb3BlcmF0aW9ucyB1bmxlc3MgaXQgaXMgbWVudGlvbmVkIHRvIGJlIG9wdGlvbmFsIGlu
IHRoZSBmb2xsb3dpbmcKPiAgICAqIGxpc3QuCj4gQEAgLTI2Nyw3ICsyNjcsNyBAQCBpbnQgX3Zk
cGFfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgaW50IG52cXMpOwo+
ICAgdm9pZCBfdmRwYV91bnJlZ2lzdGVyX2RldmljZShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYp
Owo+ICAgCj4gICAvKioKPiAtICogdmRwYV9kcml2ZXIgLSBvcGVyYXRpb25zIGZvciBhIHZEUEEg
ZHJpdmVyCj4gKyAqIHN0cnVjdCB2ZHBhX2RyaXZlciAtIG9wZXJhdGlvbnMgZm9yIGEgdkRQQSBk
cml2ZXIKPiAgICAqIEBkcml2ZXI6IHVuZGVybHlpbmcgZGV2aWNlIGRyaXZlcgo+ICAgICogQHBy
b2JlOiB0aGUgZnVuY3Rpb24gdG8gY2FsbCB3aGVuIGEgZGV2aWNlIGlzIGZvdW5kLiAgUmV0dXJu
cyAwIG9yIC1lcnJuby4KPiAgICAqIEByZW1vdmU6IHRoZSBmdW5jdGlvbiB0byBjYWxsIHdoZW4g
YSBkZXZpY2UgaXMgcmVtb3ZlZC4KPiBAQCAtMzQ0LDE4ICszNDQsMTggQEAgc3RhdGljIGlubGlu
ZSB2b2lkIHZkcGFfZ2V0X2NvbmZpZyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHVuc2lnbmVk
IG9mZnNldCwKPiAgIH0KPiAgIAo+ICAgLyoqCj4gLSAqIHZkcGFfbWdtdGRldl9vcHMgLSB2ZHBh
IGRldmljZSBvcHMKPiAtICogQGRldl9hZGQ6CUFkZCBhIHZkcGEgZGV2aWNlIHVzaW5nIGFsbG9j
IGFuZCByZWdpc3Rlcgo+IC0gKgkJQG1kZXY6IHBhcmVudCBkZXZpY2UgdG8gdXNlIGZvciBkZXZp
Y2UgYWRkaXRpb24KPiAtICoJCUBuYW1lOiBuYW1lIG9mIHRoZSBuZXcgdmRwYSBkZXZpY2UKPiAt
ICoJCURyaXZlciBuZWVkIHRvIGFkZCBhIG5ldyBkZXZpY2UgdXNpbmcgX3ZkcGFfcmVnaXN0ZXJf
ZGV2aWNlKCkKPiAtICoJCWFmdGVyIGZ1bGx5IGluaXRpYWxpemluZyB0aGUgdmRwYSBkZXZpY2Uu
IERyaXZlciBtdXN0IHJldHVybiAwCj4gLSAqCQlvbiBzdWNjZXNzIG9yIGFwcHJvcHJpYXRlIGVy
cm9yIGNvZGUuCj4gLSAqIEBkZXZfZGVsOglSZW1vdmUgYSB2ZHBhIGRldmljZSB1c2luZyB1bnJl
Z2lzdGVyCj4gLSAqCQlAbWRldjogcGFyZW50IGRldmljZSB0byB1c2UgZm9yIGRldmljZSByZW1v
dmFsCj4gLSAqCQlAZGV2OiB2ZHBhIGRldmljZSB0byByZW1vdmUKPiAtICoJCURyaXZlciBuZWVk
IHRvIHJlbW92ZSB0aGUgc3BlY2lmaWVkIGRldmljZSBieSBjYWxsaW5nCj4gLSAqCQlfdmRwYV91
bnJlZ2lzdGVyX2RldmljZSgpLgo+ICsgKiBzdHJ1Y3QgdmRwYV9tZ210ZGV2X29wcyAtIHZkcGEg
ZGV2aWNlIG9wcwo+ICsgKiBAZGV2X2FkZDogQWRkIGEgdmRwYSBkZXZpY2UgdXNpbmcgYWxsb2Mg
YW5kIHJlZ2lzdGVyCj4gKyAqCSAgICAgQG1kZXY6IHBhcmVudCBkZXZpY2UgdG8gdXNlIGZvciBk
ZXZpY2UgYWRkaXRpb24KPiArICoJICAgICBAbmFtZTogbmFtZSBvZiB0aGUgbmV3IHZkcGEgZGV2
aWNlCj4gKyAqCSAgICAgRHJpdmVyIG5lZWQgdG8gYWRkIGEgbmV3IGRldmljZSB1c2luZyBfdmRw
YV9yZWdpc3Rlcl9kZXZpY2UoKQo+ICsgKgkgICAgIGFmdGVyIGZ1bGx5IGluaXRpYWxpemluZyB0
aGUgdmRwYSBkZXZpY2UuIERyaXZlciBtdXN0IHJldHVybiAwCj4gKyAqCSAgICAgb24gc3VjY2Vz
cyBvciBhcHByb3ByaWF0ZSBlcnJvciBjb2RlLgo+ICsgKiBAZGV2X2RlbDogUmVtb3ZlIGEgdmRw
YSBkZXZpY2UgdXNpbmcgdW5yZWdpc3Rlcgo+ICsgKgkgICAgIEBtZGV2OiBwYXJlbnQgZGV2aWNl
IHRvIHVzZSBmb3IgZGV2aWNlIHJlbW92YWwKPiArICoJICAgICBAZGV2OiB2ZHBhIGRldmljZSB0
byByZW1vdmUKPiArICoJICAgICBEcml2ZXIgbmVlZCB0byByZW1vdmUgdGhlIHNwZWNpZmllZCBk
ZXZpY2UgYnkgY2FsbGluZwo+ICsgKgkgICAgIF92ZHBhX3VucmVnaXN0ZXJfZGV2aWNlKCkuCj4g
ICAgKi8KPiAgIHN0cnVjdCB2ZHBhX21nbXRkZXZfb3BzIHsKPiAgIAlpbnQgKCpkZXZfYWRkKShz
dHJ1Y3QgdmRwYV9tZ210X2RldiAqbWRldiwgY29uc3QgY2hhciAqbmFtZSk7CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
