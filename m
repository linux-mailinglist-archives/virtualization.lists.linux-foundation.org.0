Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 230585397E6
	for <lists.virtualization@lfdr.de>; Tue, 31 May 2022 22:19:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36BE084007;
	Tue, 31 May 2022 20:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZK73dCMc-25r; Tue, 31 May 2022 20:19:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E1EF084006;
	Tue, 31 May 2022 20:19:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56902C0081;
	Tue, 31 May 2022 20:19:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54B6FC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 May 2022 20:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CBB56129A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 May 2022 20:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wu6eTPbxiuUQ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 May 2022 20:19:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9E676104D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 May 2022 20:19:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+EBE9lFzrhCRixB8C6x+TAKZDcMTfDGaaxXsceRnwryl5uPgntMPX+xjoftyFFHkip0+VYJTTdzoFnbKzsyVh0wV/jJeTTWUJrDtGB38btkwjl8ZkpcvQul/v0SedLiyGei7oieMOs0N8ta/VvIfNTFPTU9SL3vQakzAh5z6/LvWXbMpKuGTntSrDYQZZkqacrZY181sn10JmliM804PHrJ2sgyOe5rBRzacx/AushwwMESf6vsDE+MGA4cMrJkDI2lOz5cdQQ2gWTcGBbIOUTalCCNNhTMatkGTnkBS0HMJioVWlJYw94UtW5h0RNBxYxj4TLgC2AXEXNB4SJECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzJmICiAQKgjMwzESfIEE+AbMFPyL4g1OcVLlBLfRsc=;
 b=hr8e6VLZKb7xlYSL/VBUF+LJ+I2jTwG/QEsBDuKwwT2N8U2Sdjfk9fy1LOk1L+t35s3j+vcQ7fLh+96GX2Hnq1J1xDjzPnL5msjL+ajd/TmPJRPNErxa8O7BOIUM6YH7JDQTUP+Qe5Ovq/0kfgEIGKvsZla6ISDjbJJ/XmHz2T3xLrjgttX4VRhqNMXX1hIWw4h4rzXYL8Hl/LPC2xwJDiVtGLP+rfh2HWmr2sSTeC4x8kVnAnLx4z/c/7beeKSOjnnX3qb+0n8lRGwYiRPKlKpd92dKpsnJ8iEBYdU60GVsYiWQ9JNrBeDI9XDdijuPOXxx70tza188V2apPa//2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzJmICiAQKgjMwzESfIEE+AbMFPyL4g1OcVLlBLfRsc=;
 b=oUlI1VbiLUUxPRduC5SZlQZ/LEnp5bKMOTVvL5Ylc0PwloPtEcbhzCbuGSjCQNl68rkyrdyUhGd1orXZq4Q0qh3W4v/3ot+m+xN5xpV+l1zCsZXHknQGKU5TLOM8cPMX3Qj3SZk0e3INeZcZdv0hXu4iRMWYjPTEMVt9WaRfd9js6MIvaVYnflfANtWWJqHttOok7F4ZgVwJSELcEnqg9N5e0Ut+3dgYBWGD/ZYFdFYpNUKxNzYBwcUCGtsge1GI0+K9pR9Jr2pkyKRrZh9jJEh6s2oyAnEXgc1Gny6iVLMaYTuLLJQVWttCuyUSleDFq8biNFud1iOtTEQDlqUIAw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CH2PR12MB4969.namprd12.prod.outlook.com (2603:10b6:610:68::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 20:19:45 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::489d:7d33:3194:b854]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::489d:7d33:3194:b854%3]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 20:19:45 +0000
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH v4 0/4] Implement vdpasim stop operation
Thread-Topic: [PATCH v4 0/4] Implement vdpasim stop operation
Thread-Index: AQHYcP5BrBz66eonZEeOxjwIzt98aa0xHKkwgAFx+gCABD0SgIACqRJg
Date: Tue, 31 May 2022 20:19:45 +0000
Message-ID: <PH0PR12MB5481695930E7548BAAF1B0D9DCDC9@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20220526124338.36247-1-eperezma@redhat.com>
 <PH0PR12MB54819C6C6DAF6572AEADC1AEDCD99@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20220527065442-mutt-send-email-mst@kernel.org>
 <CACGkMEubfv_OJOsJ_ROgei41Qx4mPO0Xz8rMVnO8aPFiEqr8rA@mail.gmail.com>
In-Reply-To: <CACGkMEubfv_OJOsJ_ROgei41Qx4mPO0Xz8rMVnO8aPFiEqr8rA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f3fd43f-da04-4b39-9571-08da4342e73f
x-ms-traffictypediagnostic: CH2PR12MB4969:EE_
x-microsoft-antispam-prvs: <CH2PR12MB4969575B919A02E8C90E1D3ADCDC9@CH2PR12MB4969.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i8FwMQjRFoeRRIJ04MOHNsI7Wm9twSzSK0OQjCSwVTMlTudaTPaatX1J3O5b5rmh0gR0cXJYA1BmkZ8C+k3XJpWlcxXpT+i64KTYM25Kw73udH43eMLH1QSWuGpriGG83QLTJ8kJ98F7V/hy1T4bePCFWS1ygDPiY/gCtinIE8gpJjXy9PgtJXJvGgQErV70uz59W7ULKNLadR66ZyM85vskDdqthNPsOdL0ECNjhLF+ZS+Qj0FVm3b6BnY62rOn3c3U0Oyj4SfBFjgSXAGTM/w84DX3moh77Z74UogPW0oewIo2POPTMgJ77wXT2bPESDAFbl7UbAAuW0QXkqsOq+AJ98oCohwqRdhjfAIUUcoebKwmsAqwXw5/yJ1DEKq/M2miD0SIKlmez1ulMmMiVOuY+WFdYVAexnxQzDxWlAd02U+Rn+v7lm/7etJqx22TVT94DMH3a+G2G86ohG+PaDR+OfJQBOozdlYz3FG/zPvRwaA+IWzFlaUVZgIjVKPs8Fa8l1CAF1G0gyf3zBqgpsGRlgn8hVRJWMYJpR+PsAudtXJ2tdUfl5T6ga7URGrmNI82/bqhR7sbn79tzXwU4LYvpP9qWGqckGuj9NGtQmemJbzQa7cvAJyJi13ML84DkJo1u2UCRjyMjAsORUuqYHjGDTvGEvEYdTIj4LJ4r+vv/vXzGzxfij3cNMoIKFeN7X/oHsDuugXKUVND8M0JMEzTZD2Am/fk6xUQcikt6lt76e7PU1NKr2DGST3T80xMgzQJNoSC9zpYbRb2TWZ8bFY1/RX2h3COI5CTo/9P8L8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(966005)(38070700005)(66946007)(66556008)(66446008)(8676002)(2906002)(4326008)(122000001)(508600001)(66476007)(76116006)(64756008)(110136005)(86362001)(54906003)(316002)(9686003)(186003)(53546011)(7696005)(6506007)(83380400001)(38100700002)(55016003)(5660300002)(66574015)(8936002)(7416002)(52536014)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2RVS2xySllPMUFyUlhsSFJ0RmE4VGlSRUxRb3luUVI1aHBoTFZzSnM4THpl?=
 =?utf-8?B?TGFnV2tDdWh6QVFkazNzWFhjTHpuU3E0ZktvU0RSYzdjREVKdGlCd0c5eWFm?=
 =?utf-8?B?ZzVaSHUvZDVPb3ZnMHJKNDBSaUNXWGV5eERjdzRQNnJybnRiaXB5T245VXhv?=
 =?utf-8?B?ckdoQ0Fla01VUjRPWFRJYmFMODRrOFpFMlVKQ1JqRkxoajBSdVVpMVh0Wmp5?=
 =?utf-8?B?WTN0WDRrbmwyZUdaRGxENlluRExrWEFXZXVIczN0ZFBxZjBnazNOMkpKa3Jl?=
 =?utf-8?B?UWJqYmNJMlpDaGtRMTNIYk1BTlZvUmN4VDdrMHlhc1haN2NoSXdkODh2aEtV?=
 =?utf-8?B?Y3VXa1hpR3hsaEdobDdHdUV0Y1hpY2lqbGVIeFBJUTBLbFo3aDRSWHFoc2Jr?=
 =?utf-8?B?cmw0YjJOdHRMdHREYTJxQmJ3ZEZCSlVXNCtyVnpVVzhhMWtwN0JGZHhrWFY0?=
 =?utf-8?B?djNLUW1KTXFGbFRTN0FHM1k1aGdWcU9sRVk1QWdtWlpYTjA5R2JOeDR6bkFP?=
 =?utf-8?B?TUZRUWVpT28wK3JRK0hhbWpVbStwaTdrV01wbXlHM1VqOE5GUTVlNVN5dEI4?=
 =?utf-8?B?NVA4L2w5OGYyS1R6TXBsSTNoempsVXFnOTdNQ3pKMHNYWVE4OFltOUtpanpo?=
 =?utf-8?B?bi95ZSs3aTZoSHh3Nzlicm5FcWQzU1pRU1d6bVFVVGE5aU9mTjN5OThSUkla?=
 =?utf-8?B?ZVhnNUtCcFpkdEdKZkk2YVhpZFFrMjdjSW9QdXl0VldURWZpdmMwa3pWZ3lj?=
 =?utf-8?B?WU1kZkZZOTFzOXFQSnQ4eUdyS2VpSXdoYmhhYk52ck1YN2hDcUpyL0krajZO?=
 =?utf-8?B?NWxJd1dYRzZ6ZWRCaDg1dS9JWXRCMHIyZXB5VFVKQ2xaRWJJNnVyTWxWY3B5?=
 =?utf-8?B?SWx2UFphTDFYZkE5THVmcXFNbEVudWJlOURHRUFUNXIvSG1lVFl3bjFkdzY5?=
 =?utf-8?B?bEthV0JmS1V5Q1VmMlZCOTFzSXZaVm5iSFBjR1kvSncwMkxxZnJQcUkvQzE4?=
 =?utf-8?B?a2xMSkRWMkFaR3ZnNFArYnhqMG10N0kveWlmeEQxM0N4cFR5azdyVmRuaEpY?=
 =?utf-8?B?cDdqSVlFY3JoVmNWZE55QldFQ0dlM1k2azZpNDJlbHhON1NoR1pQVlZWdWZ4?=
 =?utf-8?B?WUh3dXlYV1ExQit3U2FXSElaVFNrNGJKZUlHRDJ4SFhKMDV3UzhHcGxWUnRU?=
 =?utf-8?B?TVZFZEVZMDYxWDNjME90QU1odEsxclpVa1FyWFg5c1RnbkEyMGwxVFlVSzVa?=
 =?utf-8?B?RDdnTHRkaWlySUg0eFEwTDZ0MDJsRHlRWHpLdS9ZRDFSTDBBS3hHSVpRK0lP?=
 =?utf-8?B?KzN3Zlp4ZlhoVmtsdmZCdU5MbmxkNUROREM4Tzh0Z0F0REZHK1E5VWlZdk56?=
 =?utf-8?B?YzdRb0xqb1FYVU84Z0lFOTR3aS9JazhWM0FBenorNHBoaW84WkNlZHNUK2s3?=
 =?utf-8?B?Y21LZUhSbmkyaVJHaUxGMW51b0VjYXloZWVYdUg1Z0VFd0FPVTVnVzdVK3RJ?=
 =?utf-8?B?UUdrWUozL1EyMlY3eFd0ZDlOWWhRaGJ3Ulc2Z2JYWSswWWtSRWwvSGxEaUJB?=
 =?utf-8?B?bTF0TS9xRmpJcGRnTXhYckxxSFNDYjVGRC9kSHlodzVzUDlKYjl6am9vNDBl?=
 =?utf-8?B?WTNYeUhiNFJ5VFZYd3h3VmFYMDBJZ2Z5NEVBQk5YQlh5eEJ2NDB5WUdjL3dQ?=
 =?utf-8?B?UFhkZDlnS2d0SFo4eERBVFM1blZ1RFhCVTZkcXJSNkF1UFYvb2RoRVhjekEx?=
 =?utf-8?B?NHV5aFlQclFMNXk0WUlPdTloZzVudWJ5U2NtWTJIUVlBbzBZNHF1UVBlb05y?=
 =?utf-8?B?T05vMGhqZFc4SklLQUVYK0pILy92T1dkcWNjbFF2cktzRGc4K3BoM2tha3cy?=
 =?utf-8?B?NVRWVVUwQWoxRzEvdk96UUVIQTVjd0pKL3FDemRxTWVGUGZRbjR2UGdjcTZN?=
 =?utf-8?B?eXV5WEFTWFFMSkloZmtiaDJpeGlOL3dxbzFVRmxLb1FQK3Ixelo4bEh1YWRM?=
 =?utf-8?B?bzJ1M2pudCt5MmRqb2ZIU3BUQks0Q1lPSDJRWlFNQTBSNHJ5VnowdmxaQk1h?=
 =?utf-8?B?VXlJeXRHUmNMcHFFeVBENy9LcWQveHFlSVd1QUpEeDZzRUFabkhVeGlkNjJp?=
 =?utf-8?B?aVFNN0xYbTh1bGFzOWhEbEZpZVllY3RuS0o4cUIxNXhCMm04aEFyTVJia25h?=
 =?utf-8?B?Rm5IdkcyWHl3OGVxb0tzejlhRTNFNXI3d2c2VTIzRUt1MmVFdXpCN2F2Z0Ex?=
 =?utf-8?B?c3l2WGl2OE56MFRobGtDSXhSZnlhZnlwamZzQXkxZzI1QmRrNUJaWWJGOE5l?=
 =?utf-8?B?UlBLZUNoTGozbVJTMWl0RzBkMGQrRnVHc0o5RzlYY3FhRzA0MU9acUJXUmVM?=
 =?utf-8?Q?EqkUd4XetiOrlw8Aif5QvfKAECNpji3mM5ZkjzU3hxPyx?=
x-ms-exchange-antispam-messagedata-1: ljJ9DRMJUqw65Q==
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3fd43f-da04-4b39-9571-08da4342e73f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 20:19:45.2484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QwZCPTANLmRp+ytrvlcUVPdKxOpW1y15kYAU1/S57uIg4fYoQDAH2nfWMDZdC02wKiR6IprJHSt2qDCLL7U+DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4969
Cc: "tanuj.kamde@amd.com" <tanuj.kamde@amd.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Wu Zongyong <wuzongyong@linux.alibaba.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 "pabloc@xilinx.com" <pabloc@xilinx.com>, Eli Cohen <elic@nvidia.com>,
 Zhang Min <zhang.min9@zte.com.cn>, "lulu@redhat.com" <lulu@redhat.com>,
 =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>,
 "Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
 "martinh@xilinx.com" <martinh@xilinx.com>,
 Xie Yongji <xieyongji@bytedance.com>, "dinang@xilinx.com" <dinang@xilinx.com>,
 "habetsm.xilinx@gmail.com" <habetsm.xilinx@gmail.com>,
 Longpeng <longpeng2@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "lvivier@redhat.com" <lvivier@redhat.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ecree.xilinx@gmail.com" <ecree.xilinx@gmail.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "martinpo@xilinx.com" <martinpo@xilinx.com>,
 "gautam.dawar@amd.com" <gautam.dawar@amd.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
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
From: Parav Pandit via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Parav Pandit <parav@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFN1bmRh
eSwgTWF5IDI5LCAyMDIyIDExOjM5IFBNDQo+IA0KPiBPbiBGcmksIE1heSAyNywgMjAyMiBhdCA2
OjU2IFBNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOg0KPiA+DQo+
ID4gT24gVGh1LCBNYXkgMjYsIDIwMjIgYXQgMTI6NTQ6MzJQTSArMDAwMCwgUGFyYXYgUGFuZGl0
IHdyb3RlOg0KPiA+ID4NCj4gPiA+DQo+ID4gPiA+IEZyb206IEV1Z2VuaW8gUMOpcmV6IDxlcGVy
ZXptYUByZWRoYXQuY29tPg0KPiA+ID4gPiBTZW50OiBUaHVyc2RheSwgTWF5IDI2LCAyMDIyIDg6
NDQgQU0NCj4gPiA+DQo+ID4gPiA+IEltcGxlbWVudCBzdG9wIG9wZXJhdGlvbiBmb3IgdmRwYV9z
aW0gZGV2aWNlcywgc28gdmhvc3QtdmRwYSB3aWxsDQo+ID4gPiA+IG9mZmVyDQo+ID4gPiA+DQo+
ID4gPiA+IHRoYXQgYmFja2VuZCBmZWF0dXJlIGFuZCB1c2Vyc3BhY2UgY2FuIGVmZmVjdGl2ZWx5
IHN0b3AgdGhlIGRldmljZS4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gVGhp
cyBpcyBhIG11c3QgYmVmb3JlIGdldCB2aXJ0cXVldWUgaW5kZXhlcyAoYmFzZSkgZm9yIGxpdmUN
Cj4gPiA+ID4gbWlncmF0aW9uLA0KPiA+ID4gPg0KPiA+ID4gPiBzaW5jZSB0aGUgZGV2aWNlIGNv
dWxkIG1vZGlmeSB0aGVtIGFmdGVyIHVzZXJsYW5kIGdldHMgdGhlbS4gVGhlcmUNCj4gPiA+ID4g
YXJlDQo+ID4gPiA+DQo+ID4gPiA+IGluZGl2aWR1YWwgd2F5cyB0byBwZXJmb3JtIHRoYXQgYWN0
aW9uIGZvciBzb21lIGRldmljZXMNCj4gPiA+ID4NCj4gPiA+ID4gKFZIT1NUX05FVF9TRVRfQkFD
S0VORCwgVkhPU1RfVlNPQ0tfU0VUX1JVTk5JTkcsIC4uLikgYnV0DQo+IHRoZXJlDQo+ID4gPiA+
IHdhcyBubw0KPiA+ID4gPg0KPiA+ID4gPiB3YXkgdG8gcGVyZm9ybSBpdCBmb3IgYW55IHZob3N0
IGRldmljZSAoYW5kLCBpbiBwYXJ0aWN1bGFyLCB2aG9zdC12ZHBhKS4NCj4gPiA+ID4NCj4gPiA+
ID4NCj4gPiA+ID4NCj4gPiA+ID4gQWZ0ZXIgdGhlIHJldHVybiBvZiBpb2N0bCB3aXRoIHN0b3Ag
IT0gMCwgdGhlIGRldmljZSBNVVNUIGZpbmlzaA0KPiA+ID4gPiBhbnkNCj4gPiA+ID4NCj4gPiA+
ID4gcGVuZGluZyBvcGVyYXRpb25zIGxpa2UgaW4gZmxpZ2h0IHJlcXVlc3RzLiBJdCBtdXN0IGFs
c28gcHJlc2VydmUNCj4gPiA+ID4gYWxsDQo+ID4gPiA+DQo+ID4gPiA+IHRoZSBuZWNlc3Nhcnkg
c3RhdGUgKHRoZSB2aXJ0cXVldWUgdnJpbmcgYmFzZSBwbHVzIHRoZSBwb3NzaWJsZQ0KPiA+ID4g
PiBkZXZpY2UNCj4gPiA+ID4NCj4gPiA+ID4gc3BlY2lmaWMgc3RhdGVzKSB0aGF0IGlzIHJlcXVp
cmVkIGZvciByZXN0b3JpbmcgaW4gdGhlIGZ1dHVyZS4gVGhlDQo+ID4gPiA+DQo+ID4gPiA+IGRl
dmljZSBtdXN0IG5vdCBjaGFuZ2UgaXRzIGNvbmZpZ3VyYXRpb24gYWZ0ZXIgdGhhdCBwb2ludC4N
Cj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gQWZ0ZXIgdGhlIHJldHVybiBvZiBp
b2N0bCB3aXRoIHN0b3AgPT0gMCwgdGhlIGRldmljZSBjYW4gY29udGludWUNCj4gPiA+ID4NCj4g
PiA+ID4gcHJvY2Vzc2luZyBidWZmZXJzIGFzIGxvbmcgYXMgdHlwaWNhbCBjb25kaXRpb25zIGFy
ZSBtZXQgKHZxIGlzDQo+ID4gPiA+IGVuYWJsZWQsDQo+ID4gPiA+DQo+ID4gPiA+IERSSVZFUl9P
SyBzdGF0dXMgYml0IGlzIGVuYWJsZWQsIGV0YykuDQo+ID4gPg0KPiA+ID4gSnVzdCB0byBiZSBj
bGVhciwgd2UgYXJlIGFkZGluZyB2ZHBhIGxldmVsIG5ldyBpb2N0bCgpIHRoYXQgZG9lc27igJl0
IG1hcCB0bw0KPiBhbnkgbWVjaGFuaXNtIGluIHRoZSB2aXJ0aW8gc3BlYy4NCj4gPiA+DQo+ID4g
PiBXaHkgY2FuJ3Qgd2UgdXNlIHRoaXMgaW9jdGwoKSB0byBpbmRpY2F0ZSBkcml2ZXIgdG8gc3Rh
cnQvc3RvcCB0aGUgZGV2aWNlDQo+IGluc3RlYWQgb2YgZHJpdmluZyBpdCB0aHJvdWdoIHRoZSBk
cml2ZXJfb2s/DQo+ID4gPiBUaGlzIGlzIGluIHRoZSBjb250ZXh0IG9mIG90aGVyIGRpc2N1c3Np
b24gd2UgaGFkIGluIHRoZSBMTSBzZXJpZXMuDQo+ID4NCj4gPiBJZiB0aGVyZSdzIHNvbWV0aGlu
ZyBpbiB0aGUgc3BlYyB0aGF0IGRvZXMgdGhpcyB0aGVuIGxldCdzIHVzZSB0aGF0Lg0KPiANCj4g
QWN0dWFsbHksIHdlIHRyeSB0byBwcm9wb3NlIGEgaW5kZXBlbmRlbnQgZmVhdHVyZSBoZXJlOg0K
PiANCj4gaHR0cHM6Ly9saXN0cy5vYXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8tZGV2LzIw
MjExMS9tc2cwMDAyMC5odG1sDQo+IA0KVGhpcyB3aWxsIHN0b3AgdGhlIGRldmljZSBmb3IgYWxs
IHRoZSBvcGVyYXRpb25zLg0KT25jZSB0aGUgZGV2aWNlIGlzIHN0b3BwZWQsIGl0cyBzdGF0ZSBj
YW5ub3QgYmUgcXVlcmllZCBmdXJ0aGVyIGFzIGRldmljZSB3b24ndCByZXNwb25kLg0KSXQgaGFz
IGxpbWl0ZWQgdXNlIGNhc2UuDQpXaGF0IHdlIG5lZWQgaXMgdG8gc3RvcCBub24gYWRtaW4gcXVl
dWUgcmVsYXRlZCBwb3J0aW9uIG9mIHRoZSBkZXZpY2UuDQoNCj4gRG9lcyBpdCBtYWtlIHNlbnNl
IHRvIHlvdT8NCj4gDQo+IFRoYW5rcw0KPiANCj4gPiBVbmZvcnR1bmF0ZWx5IHRoZSBMTSBzZXJp
ZXMgc2VlbXMgdG8gYmUgc3R1Y2sgb24gbW92aW5nIGJpdHMgYXJvdW5kDQo+ID4gd2l0aCB0aGUg
YWRtaW4gdmlydHF1ZXVlIC4uLg0KPiA+DQo+ID4gLS0NCj4gPiBNU1QNCj4gPg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
