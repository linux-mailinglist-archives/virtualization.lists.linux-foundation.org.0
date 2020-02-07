Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 676CE155E33
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D7F292278E;
	Fri,  7 Feb 2020 18:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLwt+AZwNGy1; Fri,  7 Feb 2020 18:36:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F4073226B7;
	Fri,  7 Feb 2020 18:35:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD26CC013E;
	Fri,  7 Feb 2020 18:35:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 519B3C1D81
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C79C2264A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lefWRyOCYHeq
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 06A7D2040D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:53 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 2D0EA305D340; Fri,  7 Feb 2020 20:16:40 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 16A403052070;
 Fri,  7 Feb 2020 20:16:40 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 34/78] KVM: x86: intercept the write access on sidt and
 other emulated instructions
Date: Fri,  7 Feb 2020 20:15:52 +0200
Message-Id: <20200207181636.1065-35-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
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

VGhpcyBpcyBuZWVkZWQgZm9yIHRoZSBpbnRyb3NwZWN0aW9uIHN1YnN5c3RlbSB0byB0cmFjayB0
aGUgY2hhbmdlcyB0bwpkZXNjcmlwdG9yIHRhYmxlIHJlZ2lzdGVycy4KClNpZ25lZC1vZmYtYnk6
IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9r
dm0veDg2LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCA4YzZh
OGQwM2U0MWEuLjZlNjY1MzQxY2M4MCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisr
KyBiL2FyY2gveDg2L2t2bS94ODYuYwpAQCAtNTQ1MCwxMSArNTQ1MCwxNCBAQCBzdGF0aWMgaW50
IGt2bV93cml0ZV9ndWVzdF92aXJ0X2hlbHBlcihndmFfdCBhZGRyLCB2b2lkICp2YWwsIHVuc2ln
bmVkIGludCBieXRlcwogCiAJCWlmIChncGEgPT0gVU5NQVBQRURfR1ZBKQogCQkJcmV0dXJuIFg4
NkVNVUxfUFJPUEFHQVRFX0ZBVUxUOworCQlpZiAoIWt2bV9wYWdlX3RyYWNrX3ByZXdyaXRlKHZj
cHUsIGdwYSwgYWRkciwgZGF0YSwgdG93cml0ZSkpCisJCQlyZXR1cm4gWDg2RU1VTF9SRVRSWV9J
TlNUUjsKIAkJcmV0ID0ga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QodmNwdSwgZ3BhLCBkYXRhLCB0b3dy
aXRlKTsKIAkJaWYgKHJldCA8IDApIHsKIAkJCXIgPSBYODZFTVVMX0lPX05FRURFRDsKIAkJCWdv
dG8gb3V0OwogCQl9CisJCWt2bV9wYWdlX3RyYWNrX3dyaXRlKHZjcHUsIGdwYSwgYWRkciwgZGF0
YSwgdG93cml0ZSk7CiAKIAkJYnl0ZXMgLT0gdG93cml0ZTsKIAkJZGF0YSArPSB0b3dyaXRlOwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
