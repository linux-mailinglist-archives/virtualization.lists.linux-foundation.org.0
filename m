Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7582C9F5E
	for <lists.virtualization@lfdr.de>; Tue,  1 Dec 2020 11:35:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2877D8808F;
	Tue,  1 Dec 2020 10:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNOyRIasDNND; Tue,  1 Dec 2020 10:35:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2CA068768B;
	Tue,  1 Dec 2020 10:35:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2097EC0052;
	Tue,  1 Dec 2020 10:35:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63D81C0052
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5EC0787338
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SmOnHzJtrHf
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:35:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F02128733D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:35:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94172ACF1;
 Tue,  1 Dec 2020 10:35:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 01/20] drm/amdgpu: Fix trailing whitespaces
Date: Tue,  1 Dec 2020 11:35:23 +0100
Message-Id: <20201201103542.2182-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201103542.2182-1-tzimmermann@suse.de>
References: <20201201103542.2182-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Sam Ravnborg <sam@ravnborg.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

QWRoZXJlIHRvIGtlcm5lbCBjb2Rpbmcgc3R5bGUuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggNWYzMDQ0MjVjOTQ4Li5kYTIzYzBmMjEz
MTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTQ5
MjIsOCArNDkyMiw4IEBAIHBjaV9lcnNfcmVzdWx0X3QgYW1kZ3B1X3BjaV9lcnJvcl9kZXRlY3Rl
ZChzdHJ1Y3QgcGNpX2RldiAqcGRldiwgcGNpX2NoYW5uZWxfc3RhCiAJY2FzZSBwY2lfY2hhbm5l
bF9pb19ub3JtYWw6CiAJCXJldHVybiBQQ0lfRVJTX1JFU1VMVF9DQU5fUkVDT1ZFUjsKIAkvKiBG
YXRhbCBlcnJvciwgcHJlcGFyZSBmb3Igc2xvdCByZXNldCAqLwotCWNhc2UgcGNpX2NoYW5uZWxf
aW9fZnJvemVuOgkJCi0JCS8qCQkKKwljYXNlIHBjaV9jaGFubmVsX2lvX2Zyb3plbjoKKwkJLyoK
IAkJICogQ2FuY2VsIGFuZCB3YWl0IGZvciBhbGwgVERScyBpbiBwcm9ncmVzcyBpZiBmYWlsaW5n
IHRvCiAJCSAqIHNldCAgYWRldi0+aW5fZ3B1X3Jlc2V0IGluIGFtZGdwdV9kZXZpY2VfbG9ja19h
ZGV2CiAJCSAqCkBAIC01MDE0LDcgKzUwMTQsNyBAQCBwY2lfZXJzX3Jlc3VsdF90IGFtZGdwdV9w
Y2lfc2xvdF9yZXNldChzdHJ1Y3QgcGNpX2RldiAqcGRldikKIAkJZ290byBvdXQ7CiAJfQogCi0J
YWRldi0+aW5fcGNpX2Vycl9yZWNvdmVyeSA9IHRydWU7CQorCWFkZXYtPmluX3BjaV9lcnJfcmVj
b3ZlcnkgPSB0cnVlOwogCXIgPSBhbWRncHVfZGV2aWNlX3ByZV9hc2ljX3Jlc2V0KGFkZXYsIE5V
TEwsICZuZWVkX2Z1bGxfcmVzZXQpOwogCWFkZXYtPmluX3BjaV9lcnJfcmVjb3ZlcnkgPSBmYWxz
ZTsKIAlpZiAocikKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
