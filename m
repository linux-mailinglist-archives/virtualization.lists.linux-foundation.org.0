Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A66197894
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EFE03878E5;
	Mon, 30 Mar 2020 10:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Icq2MbLcfNAe; Mon, 30 Mar 2020 10:13:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A466E87AB1;
	Mon, 30 Mar 2020 10:13:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B370C1D85;
	Mon, 30 Mar 2020 10:13:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BED2DC1D92
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A23618699B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wg9fAAIb1fZU
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 507F186A02
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4F9873074B70; Mon, 30 Mar 2020 13:12:54 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 24CC5305B7A1;
 Mon, 30 Mar 2020 13:12:54 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 36/81] KVM: x86: intercept the write access on sidt and
 other emulated instructions
Date: Mon, 30 Mar 2020 13:12:23 +0300
Message-Id: <20200330101308.21702-37-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtualization@lists.linux-foundation.org
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
LWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCBkMzVj
ZGRhMTE1Y2MuLjJhYWEwZGQ4YjAyYSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisr
KyBiL2FyY2gveDg2L2t2bS94ODYuYwpAQCAtNTUzOSwxMSArNTUzOSwxNCBAQCBzdGF0aWMgaW50
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
