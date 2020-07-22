Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 19838229C70
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BA72487A0A;
	Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntBzbbqgqOj1; Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D5561885ED;
	Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B496FC004E;
	Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73850C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 636908843A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXAyTPsLImLH
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 667B1879FF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:33 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 E33593016C4A; Wed, 22 Jul 2020 19:01:31 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D81173072785;
 Wed, 22 Jul 2020 19:01:31 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 01/34] KVM: x86: export .get_vmfunc_status()
Date: Wed, 22 Jul 2020 19:00:48 +0300
Message-Id: <20200722160121.9601-2-alazar@bitdefender.com>
In-Reply-To: <20200722160121.9601-1-alazar@bitdefender.com>
References: <20200722160121.9601-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>,
 =?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

RnJvbTogTWFyaWFuIFJvdGFyaXUgPG1hcmlhbi5jLnJvdGFyaXVAZ21haWwuY29tPgoKVGhlIGlu
dHJvc3BlY3Rpb24gdG9vbCB1c2VzIHRoaXMgZnVuY3Rpb24gdG8gY2hlY2sgdGhlIGhhcmR3YXJl
IHN1cHBvcnQKZm9yIFZNRlVOQywgd2hpY2ggY2FuIGJlIHVzZWQgZWl0aGVyIHRvIHNpbmdsZXN0
ZXAgdkNQVXMKb24gYSB1bnByb3RlY3RlZCBFUFQgdmlldyBvciB0byB1c2UgI1ZFIGluIG9yZGVy
IHRvIGZpbHRlciBvdXQKVk0tZXhpdHMgY2F1c2VkIGJ5IEVQVCB2aW9sYXRpb25zLgoKU2lnbmVk
LW9mZi1ieTogTWFyaWFuIFJvdGFyaXUgPG1hcmlhbi5jLnJvdGFyaXVAZ21haWwuY29tPgpDby1k
ZXZlbG9wZWQtYnk6IMiYdGVmYW4gyJhpY2xlcnUgPHNzaWNsZXJ1QGJpdGRlZmVuZGVyLmNvbT4K
U2lnbmVkLW9mZi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+
Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8IDEgKwogYXJjaC94ODYva3Zt
L3ZteC92bXguYyAgICAgICAgICB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IGQ5NmJmMGUxNWVhMi4uYWI2OTg5
NzQ1ZjljIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTEzMDAsNiArMTMwMCw3IEBAIHN0
cnVjdCBrdm1feDg2X29wcyB7CiAJYm9vbCAoKnNwdF9mYXVsdCkoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KTsKIAlib29sICgqZ3B0X3RyYW5zbGF0aW9uX2ZhdWx0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpOwogCXZvaWQgKCpjb250cm9sX3NpbmdsZXN0ZXApKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
Ym9vbCBlbmFibGUpOworCWJvb2wgKCpnZXRfdm1mdW5jX3N0YXR1cykodm9pZCk7CiB9OwogCiBz
dHJ1Y3Qga3ZtX3g4Nl9uZXN0ZWRfb3BzIHsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgv
dm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCmluZGV4IDhjOWNjZDFiYTBmMC4uZWM0Mzk2
ZDVmMzZmIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2
L2t2bS92bXgvdm14LmMKQEAgLTc5OTIsNiArNzk5MiwxMSBAQCBzdGF0aWMgdm9pZCB2bXhfY29u
dHJvbF9zaW5nbGVzdGVwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCBlbmFibGUpCiAJCQkJ
Q1BVX0JBU0VEX01PTklUT1JfVFJBUF9GTEFHKTsKIH0KIAorc3RhdGljIGJvb2wgdm14X2dldF92
bWZ1bmNfc3RhdHVzKHZvaWQpCit7CisJcmV0dXJuIGNwdV9oYXNfdm14X3ZtZnVuYygpOworfQor
CiBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJ
LmhhcmR3YXJlX3Vuc2V0dXAgPSBoYXJkd2FyZV91bnNldHVwLAogCkBAIC04MTMzLDYgKzgxMzgs
NyBAQCBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9faW5pdGRhdGEgPSB7
CiAJLnNwdF9mYXVsdCA9IHZteF9zcHRfZmF1bHQsCiAJLmdwdF90cmFuc2xhdGlvbl9mYXVsdCA9
IHZteF9ncHRfdHJhbnNsYXRpb25fZmF1bHQsCiAJLmNvbnRyb2xfc2luZ2xlc3RlcCA9IHZteF9j
b250cm9sX3NpbmdsZXN0ZXAsCisJLmdldF92bWZ1bmNfc3RhdHVzID0gdm14X2dldF92bWZ1bmNf
c3RhdHVzLAogfTsKIAogc3RhdGljIF9faW5pdCBpbnQgaGFyZHdhcmVfc2V0dXAodm9pZCkKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
