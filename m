Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A957EC099F
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 18:31:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1DB95C6C;
	Fri, 27 Sep 2019 16:31:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 88DC8C21
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 16:31:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 596148B3
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 16:31:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2EBD3099F56;
	Fri, 27 Sep 2019 16:31:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B05255D6A7;
	Fri, 27 Sep 2019 16:31:45 +0000 (UTC)
Received: from zmail25.collab.prod.int.phx2.redhat.com
	(zmail25.collab.prod.int.phx2.redhat.com [10.5.83.31])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DF981808878;
	Fri, 27 Sep 2019 16:31:45 +0000 (UTC)
Date: Fri, 27 Sep 2019 12:31:45 -0400 (EDT)
From: Frediano Ziglio <fziglio@redhat.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2008023935.3565992.1569601905303.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190927132458.4359-1-christian.koenig@amd.com>
References: <20190927132458.4359-1-christian.koenig@amd.com>
Subject: Re: [Spice-devel] [PATCH 1/2] drm/qxl: stop abusing TTM to call
	driver internal functions
MIME-Version: 1.0
X-Originating-IP: [10.33.32.20, 10.4.195.27]
Thread-Topic: drm/qxl: stop abusing TTM to call driver internal functions
Thread-Index: h6xCax6HLXhUQnyV74FXBx3sP7csXQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 27 Sep 2019 16:31:45 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	daniel@ffwll.ch, airlied@redhat.com, spice-devel@lists.freedesktop.org
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

PiAKPiBUaGUgdHRtX21lbV9pb18qIGZ1bmN0aW9ucyBhcmUgYWN0dWFsbHkgaW50ZXJuYWwgdG8g
VFRNIGFuZCBzaG91bGRuJ3QgYmUKPiB1c2VkIGluIGEgZHJpdmVyLgo+IAoKQXMgZmFyIGFzIEkg
Y2FuIHNlZSBieSB5b3VyIHNlY29uZCBwYXRjaCBRWEwgaXMganVzdCB1c2luZyBleHBvcnRlZAoo
dGhhdCBpcyBub3QgaW50ZXJuYWwpIGZ1bmN0aW9ucy4KTm90IHRoYXQgdGhlIGlkZWEgb2YgbWFr
aW5nIHRoZW0gaW50ZXJuYWwgaXMgYmFkIGJ1dCB0aGlzIGNvbW1lbnQgaXMKYSB3cm9uZyBzdGF0
ZW1lbnQuCgo+IEluc3RlYWQgY2FsbCB0aGUgcXhsX3R0bV9pb19tZW1fcmVzZXJ2ZSgpIGZ1bmN0
aW9uIGRpcmVjdGx5Lgo+IAoKSSB3b3VsZCBhZGQgdGhhdCBxeGxfdHRtX2lvX21lbV9mcmVlIGlz
IGVtcHR5IHNvIHRoZSByZW1vdmFsIG9mCnR0bV9tZW1faW9fZnJlZSBpcyBmaW5lLgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oICAgIHwgIDIgKysKPiAgZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMgfCAxMSArLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vcXhsL3F4bF90dG0uYyAgICB8ICA0ICsrLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcXhsL3F4bF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oCj4gaW5k
ZXggOWUwMzRjNWZhODdkLi44YTI0ZjhlMTAxZGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3F4bC9xeGxfZHJ2LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaAo+
IEBAIC0zNTQsNiArMzU0LDggQEAgaW50IHF4bF9tb2RlX2R1bWJfbW1hcChzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbHAsCj4gIC8qIHF4bCB0dG0gKi8KPiAgaW50IHF4bF90dG1faW5pdChzdHJ1Y3QgcXhs
X2RldmljZSAqcWRldik7Cj4gIHZvaWQgcXhsX3R0bV9maW5pKHN0cnVjdCBxeGxfZGV2aWNlICpx
ZGV2KTsKPiAraW50IHF4bF90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsCj4gKwkJCSAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKTsKPiAgaW50IHF4bF9tbWFw
KHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gIAo+ICAv
KiBxeGwgaW1hZ2UgKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2Jq
ZWN0LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jCj4gaW5kZXggNTQ4ZGZl
NmYzYjI2Li4yOTllNjNhOTUxYzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfb2JqZWN0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYwo+IEBA
IC0xNDgsNyArMTQ4LDYgQEAgaW50IHF4bF9ib19rbWFwKHN0cnVjdCBxeGxfYm8gKmJvLCB2b2lk
ICoqcHRyKQo+ICB2b2lkICpxeGxfYm9fa21hcF9hdG9taWNfcGFnZShzdHJ1Y3QgcXhsX2Rldmlj
ZSAqcWRldiwKPiAgCQkJICAgICAgc3RydWN0IHF4bF9ibyAqYm8sIGludCBwYWdlX29mZnNldCkK
PiAgewo+IC0Jc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPQo+ICZiby0+dGJvLmJk
ZXYtPm1hbltiby0+dGJvLm1lbS5tZW1fdHlwZV07Cj4gIAl2b2lkICpycHRyOwo+ICAJaW50IHJl
dDsKPiAgCXN0cnVjdCBpb19tYXBwaW5nICptYXA7Cj4gQEAgLTE2MCw5ICsxNTksNyBAQCB2b2lk
ICpxeGxfYm9fa21hcF9hdG9taWNfcGFnZShzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwKPiAgCWVs
c2UKPiAgCQlnb3RvIGZhbGxiYWNrOwo+ICAKPiAtCSh2b2lkKSB0dG1fbWVtX2lvX2xvY2sobWFu
LCBmYWxzZSk7Cj4gLQlyZXQgPSB0dG1fbWVtX2lvX3Jlc2VydmUoYm8tPnRiby5iZGV2LCAmYm8t
PnRiby5tZW0pOwo+IC0JdHRtX21lbV9pb191bmxvY2sobWFuKTsKPiArCXJldCA9IHF4bF90dG1f
aW9fbWVtX3Jlc2VydmUoYm8tPnRiby5iZGV2LCAmYm8tPnRiby5tZW0pOwo+ICAKPiAgCXJldHVy
biBpb19tYXBwaW5nX21hcF9hdG9taWNfd2MobWFwLCBiby0+dGJvLm1lbS5idXMub2Zmc2V0ICsg
cGFnZV9vZmZzZXQpOwo+ICBmYWxsYmFjazoKPiBAQCAtMTkzLDE3ICsxOTAsMTEgQEAgdm9pZCBx
eGxfYm9fa3VubWFwKHN0cnVjdCBxeGxfYm8gKmJvKQo+ICB2b2lkIHF4bF9ib19rdW5tYXBfYXRv
bWljX3BhZ2Uoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsCj4gIAkJCSAgICAgICBzdHJ1Y3QgcXhs
X2JvICpibywgdm9pZCAqcG1hcCkKPiAgewo+IC0Jc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2Vy
ICptYW4gPQo+ICZiby0+dGJvLmJkZXYtPm1hbltiby0+dGJvLm1lbS5tZW1fdHlwZV07Cj4gLQo+
ICAJaWYgKChiby0+dGJvLm1lbS5tZW1fdHlwZSAhPSBUVE1fUExfVlJBTSkgJiYKPiAgCSAgICAo
Ym8tPnRiby5tZW0ubWVtX3R5cGUgIT0gVFRNX1BMX1BSSVYpKQo+ICAJCWdvdG8gZmFsbGJhY2s7
Cj4gIAo+ICAJaW9fbWFwcGluZ191bm1hcF9hdG9taWMocG1hcCk7Cj4gLQo+IC0JKHZvaWQpIHR0
bV9tZW1faW9fbG9jayhtYW4sIGZhbHNlKTsKPiAtCXR0bV9tZW1faW9fZnJlZShiby0+dGJvLmJk
ZXYsICZiby0+dGJvLm1lbSk7Cj4gLQl0dG1fbWVtX2lvX3VubG9jayhtYW4pOwo+ICAJcmV0dXJu
Owo+ICAgZmFsbGJhY2s6Cj4gIAlxeGxfYm9fa3VubWFwKGJvKTsKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0u
Ywo+IGluZGV4IDliMjQ1MTRjNzVhYS4uY2I4MGU1MTJkZDQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
dHRtLmMKPiBAQCAtMTU5LDggKzE1OSw4IEBAIHN0YXRpYyBpbnQgcXhsX3ZlcmlmeV9hY2Nlc3Mo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0Cj4gKmJvLCBzdHJ1Y3QgZmlsZSAqZmlscCkKPiAgCQkJ
CQkgIGZpbHAtPnByaXZhdGVfZGF0YSk7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgcXhsX3R0bV9p
b19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiAtCQkJCSAgc3RydWN0
IHR0bV9tZW1fcmVnICptZW0pCj4gK2ludCBxeGxfdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0
dG1fYm9fZGV2aWNlICpiZGV2LAo+ICsJCQkgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKPiAg
ewo+ICAJc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbS0+
bWVtX3R5cGVdOwo+ICAJc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYgPSBxeGxfZ2V0X3FkZXYoYmRl
dik7CgpPdGhlcndpc2UgZmluZSBmb3IgbWUuCgpGcmVkaWFubwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
