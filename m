Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B81A15A8E78
	for <lists.virtualization@lfdr.de>; Thu,  1 Sep 2022 08:43:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0050607F6;
	Thu,  1 Sep 2022 06:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0050607F6
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=W4XRsd5K
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jPcYltNCaaca; Thu,  1 Sep 2022 06:43:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A27EC607C9;
	Thu,  1 Sep 2022 06:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A27EC607C9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE443C0077;
	Thu,  1 Sep 2022 06:43:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A4D4C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Sep 2022 06:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 545F1607F4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Sep 2022 06:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 545F1607F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8G7U1b8g3emB
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Sep 2022 06:43:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 769CC607C9
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 769CC607C9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Sep 2022 06:43:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlbEqlzIUryh4KgTo++IrToJsynFPu+IHOxrDSWVQbIzGFyJxJzl1D/QFs9czFgtVF/AcFlGdI2XuI2Tyu+p0O/7Vw3sjWlWY6dbgxStkMXOOoKH6GXb0SqODpEyNb+VFy64z6p09Kc5J08xRJ41bY/8DyZeI1hyCDpVWp1rj/juuF5IDCRfXuBQMfVNtpwf78+K23umkZtnMqpaG0EnLj0+ZpIHtI+R+hnGgu/eeJBk57Eokcq8gdbXMi4a4bV5k/vSczNGwb4IBqaLd6q4HmVgupdyKmG/8y4U2/9syR+AuXCq1ijuXeKZx4RbLB5GTr4Rv0BAVH1oQ7fVX3Gfig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jW/4dsfkyJHvzunZ8Qr1OE9RrXwjgietc84hD0UVTxs=;
 b=isB5tFA79gE6q/RLG4ASQjYXh3fcT/h842zLfGszPWm4UzXcGdWjA0FcLsGhfmzCNal9un3kGwtCVauRZrhqri3RtHidLSYtpM/msWxNdcRtRU7z3y05Fgklj6wD7mxn793uwYuls6MB6Z/XpaBvd2Z3xQ3LGa96eBIk3R4ugBtPXKVEhK4voMr7gGvxd2a59HI5SeF2fUN/rUbaIzy7VxbWqw/5c/vy85F++3wmil0oBbbJ+062VA3iFlS8p8K5ok7J4IspkSvXA1GBtVFwpSRqSoz7nmC3+E4uucs/2cERBTbsmhJc1Yb1xIvn/lYl0Dj91b969hccVM/QfXWzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW/4dsfkyJHvzunZ8Qr1OE9RrXwjgietc84hD0UVTxs=;
 b=W4XRsd5KBgPJ1nIoyCAitmJMegjrxnxlAwGvpwY+G5Gkl0CUX1FubXCsbavg5ZbN8qaOt1CclM0JbICo5BIE63bgRsLt1TGRZEY+rCr99e/FluBNfghEHiCj83RnOk7uDohP9CVb/3tp08uUyuFb1ZLq3bLqCSAHy1Mmr+6XphA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5156.namprd12.prod.outlook.com (2603:10b6:610:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 06:43:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 06:43:13 +0000
Message-ID: <94cdb302-98ea-2f8d-8bdf-cf81b45dddc1@amd.com>
Date: Thu, 1 Sep 2022 08:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 05/21] drm/armada: Prepare to dynamic dma-buf locking
 specification
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
 <20220831153757.97381-6-dmitry.osipenko@collabora.com>
In-Reply-To: <20220831153757.97381-6-dmitry.osipenko@collabora.com>
X-ClientProxiedBy: AS8P251CA0024.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25ae735a-7f2d-402d-ccc1-08da8be53e1e
X-MS-TrafficTypeDiagnostic: CH0PR12MB5156:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7JUwmDosFFkFPrS256EHWy7zdlth6Ub+ZUrIpy3rH9uB7LnVNZZcMiWidd0zKEqsKe1zW/6cakddruWIbh0mHeLL9c8/VmsEIBsfvqFd0RWMswn2rGYvqF3Yw3ZvkLeu68oYTm9bbGp1WvcUPsjyAup7MPv24EonmOdHw7+oyk14D3xrJvG1GszW4R5+rc9KGozyw6q+ruqwo4r8M1O98o4ZqRsKaWCIJ0cKkwcjBJ3t8mygdeINgV0GMIrOtd2nilhNcBd9OzciPUYM5suaMp1rgYDA2//HYhNij4SdlRQUtryebgJgSyZqwt7jrcSCqk8rLSrZPyxZDKPLsv3Y1EpN845oAYRGshke5N603ACFp9V36hnNEcAD0X0vA8fey1SzGXlU29GK70JsOIUCf7X7qAm3S3OhWDho/opnRdvve16YqXGIC22JBjU/EBF5F+Ynm7DIBtyqshRsMHh173YAxwN+F1UNp2pPFVF7ho4Qr0xDxmucZLiKnZ/N6C1NtMuS9lHjp2BgF/EP6KuSHZhuSKs2PkLCDpuRaX4SdavoJe7goDCKf1GlJABzu3EADAJgGiZ8/G8AZkV5R9szqG3sydeZfIYlwhLrp1g7y4kHvLQvkWQusbX+P2k8lOzUzppL9+sgAHpgxL6dInc4yo1X0sntz9/qc+5+dz0yFbLTcr42+rxhm5V8F9n5ipf0gtAgvv3oSx3zo5pk4wNNnYVqw37gp+zn/hYC0rMucVrDI+LVXIbzsa3Xiz4h+nAqiMZVOW5wjkZGuHZhTBxwifmZ9WFZlIO3Au6jI5XLwUaqwXlFot0sW0VA5IBRhl1B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(5660300002)(83380400001)(36756003)(316002)(6666004)(31686004)(7406005)(7416002)(66574015)(110136005)(186003)(38100700002)(41300700001)(6512007)(86362001)(8936002)(31696002)(8676002)(2616005)(4326008)(6506007)(66476007)(66946007)(6486002)(478600001)(26005)(66556008)(921005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVp4MEtkMmlDV3pHeUVEYU43azJndnpqNis5TGtKZThCbjRwVmUySzJrcGNB?=
 =?utf-8?B?YmNRbnlTR0tqV3FMSEtKLzN2M0l0T3U4eHZ1Nmw2RnN4ZGhHS0pXQUs0cVZR?=
 =?utf-8?B?ZGpmeFI0TldHaU43WWxJcVFoUDk3T1BaZFk3RUNpL1A0MjVteC93VmFsbjVT?=
 =?utf-8?B?Z1BTVjNkakMxZHFGSThNRUpEdG9wdWI4MVlwa2pzcjZUMDRXVFRUSlB1NHJq?=
 =?utf-8?B?RlM5U0h2THVQa2YrVStzMEtFTW9HUkxtMlRFWUNKQVJLTzBFQVFDNFBpd3lM?=
 =?utf-8?B?ajRhZmZIa3NzaVZoK3BUMjR6MmhSZ3FNdVVaVTRQb3RtWVNDVXBmT1FvMGU4?=
 =?utf-8?B?VDVmYmZvdnZiM3Rhd0R1ZkcvbUhVTi94RGFKZGRGZ3MvR2o4SFZmVG1qU2Fj?=
 =?utf-8?B?SFB6VWNnNFp0M1EvdGFrUDNFeWlZSEJmUExiWUJmVUVTYlVJQXNBeXU5Vjdy?=
 =?utf-8?B?Rnd0a2pSbE5BbFllcWxYTTdQbVRvN004bjc5QjdTYis2N3NudlFzRzlObTE3?=
 =?utf-8?B?dysyR2JNYXJsN1h6bzJhY3F3VDE1NUQ2QUlSM1k4dCtJenR5QXdhdEN4ZFNr?=
 =?utf-8?B?YnlwR0E3ME1oM0NzYkJRRVRIcDRPTU1uV3J4Tjl5SjZrNmlpczVIL2tXbFRW?=
 =?utf-8?B?dkpXMmNVSGdzMXQ3VHF3b2E0Vnc4WDhwYVB1WG81ai9pejBHM2JMR2liY05H?=
 =?utf-8?B?eUFqTjVOSWtBaGEwbmpUcnN1bndPWnJoV2tlSE9vSkthVkRHRGVzRDd2VStq?=
 =?utf-8?B?U0Vxd1BCZ08vVWc5aEROdXVvZkFjYmVwN3RoNFc2aEQ1K3d3MmprODErUk9I?=
 =?utf-8?B?UHRxdWZUYXYwMUxBaVRCQmxmclZhbG5QZ0hua1ZlcUVHdlY4cXJ6V2FqWVlI?=
 =?utf-8?B?dFRnWmU5Q05FM3RxTVFHcUV2RG5XZWt6MTd0cFZ0L1haN2xQZFZ5TVQ4U2xH?=
 =?utf-8?B?dWtYTjN0d2JhOHdsK1p6NkdYUWdYckdMS0JqNXBud2hieUJzTFZIQ2p6STRT?=
 =?utf-8?B?Q2sweTJjeVJqdjdUdTV4aWl6dmkrSWR0b01nRGJWYmtXY2ZCWHJqbWlML0ZI?=
 =?utf-8?B?dFVOU3Z0MWprd0tOSUUzT2lsNzVtVUs3R01icjZPQzY4eUFxcXNYbkdFRzRL?=
 =?utf-8?B?aUkyWVZZQWxqaU9KNXhPeDUwWkFxclhFSkhrcVVubmh3TUZGamJmT2FkaVl3?=
 =?utf-8?B?QisyTTlZckQ5bWIrWU1hc3ptaEM1SjJBQzZXVXVyYTcrRjJZZ3RYY1JqdHNM?=
 =?utf-8?B?MUVpQStxajVIMytyVHR1TWY3bSswRm5MNzRLVlpCWVZneG5ETWo1Ylh2R2Fa?=
 =?utf-8?B?Z2l1VEpyeUtUTWtGZ25xUDBqb1N6TkJ3bmlVSTd5RzdpQm9ZY3pjQVh2NDFI?=
 =?utf-8?B?L3FrczBDRy9NRm42SzNSZld6eGxEMWZ3bTFxRmFkSzZiWitmeEJWZFF0dHRa?=
 =?utf-8?B?M0dENFUwQllsK3Y5bEN3MmtBRGtFN1JLaGdwZmRkbmxlTUlNaVVSOWI2QzhB?=
 =?utf-8?B?bFJPVTJxWjV3c3ArWDRNUGhoK1NPM1lXU29sZHZVUDQwL3c4MDMzRmdBNGRT?=
 =?utf-8?B?RkdZeTAxQW5rTTc5OFVqRm5TN0l6Mlo2QXhYbjBmSXY1VWxhN29jZzB4TVNN?=
 =?utf-8?B?TktVdTk1eTVaV0d4RkFLTlo4cmRFZkZjVDdNR3cxYk1oRVFiekp0N1ZZenZ2?=
 =?utf-8?B?RlJ0RmR2ZWp3alZ2RkZQY1dxallQdEhWdkxTL01vWEFFeXBLdnNJRCtaaGNz?=
 =?utf-8?B?NmhkYTB0SGJHZlJ4MWh4bkRtdm9pQW9IcnhDZ3NUSVAxeUJRV0NneGxzdUpO?=
 =?utf-8?B?SjR4dGJaKzBQanYwU2pqeC9JUzdEUnkxeUtvL2pVdTN5MXBlcVRUcmZ3amF6?=
 =?utf-8?B?RE5PVzFuSjBTbmt0STZUajhUWGhNck5VOFBLcGFLQk1kZVlEd2JFTm9WMHBt?=
 =?utf-8?B?OHZhYWtWVzl2dFpCbk5jR2Urb1FKUWdGb05KYjJOUUJvaWQvQWI3YTZzMU54?=
 =?utf-8?B?eW5BcGRaTUdNdS9JN25VekZMeXN5WXFzdXJkOFVjZThERXhLdkRVemh3ckxs?=
 =?utf-8?B?dFJ0NWpsU0VxSE1wWkVaN1BNWXVrdEczbW03VGpzRnc2Vm1lZDk1Mkx6VmNQ?=
 =?utf-8?Q?trMV3gWCXJHC/iDBIP6nnjaJx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ae735a-7f2d-402d-ccc1-08da8be53e1e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 06:43:13.4355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AulUexLYpzl72xOD6yOBuYcVnSKwfakmvRqXDY1U1BArPusLF1h2FYIRut6joxsX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5156
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

QW0gMzEuMDguMjIgdW0gMTc6Mzcgc2NocmllYiBEbWl0cnkgT3NpcGVua286Cj4gUHJlcGFyZSBB
cm1hZGEgZHJpdmVyIHRvIHRoZSBjb21tb24gZHluYW1pYyBkbWEtYnVmIGxvY2tpbmcgY29udmVu
dGlvbgo+IGJ5IHN0YXJ0aW5nIHRvIHVzZSB0aGUgdW5sb2NrZWQgdmVyc2lvbnMgb2YgZG1hLWJ1
ZiBBUEkgZnVuY3Rpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0
cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FybWFk
YS9hcm1hZGFfZ2VtLmMgfCA4ICsrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm1hZGEvYXJtYWRhX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZ2VtLmMK
PiBpbmRleCA1NDMwMjY1YWQ0NTguLjI2ZDEwMDY1ZDUzNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXJtYWRhL2FybWFkYV9nZW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1h
ZGEvYXJtYWRhX2dlbS5jCj4gQEAgLTY2LDggKzY2LDggQEAgdm9pZCBhcm1hZGFfZ2VtX2ZyZWVf
b2JqZWN0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ICAgCWlmIChkb2JqLT5vYmouaW1w
b3J0X2F0dGFjaCkgewo+ICAgCQkvKiBXZSBvbmx5IGV2ZXIgZGlzcGxheSBpbXBvcnRlZCBkYXRh
ICovCj4gICAJCWlmIChkb2JqLT5zZ3QpCj4gLQkJCWRtYV9idWZfdW5tYXBfYXR0YWNobWVudChk
b2JqLT5vYmouaW1wb3J0X2F0dGFjaCwKPiAtCQkJCQkJIGRvYmotPnNndCwgRE1BX1RPX0RFVklD
RSk7Cj4gKwkJCWRtYV9idWZfdW5tYXBfYXR0YWNobWVudF91bmxvY2tlZChkb2JqLT5vYmouaW1w
b3J0X2F0dGFjaCwKPiArCQkJCQkJCSAgZG9iai0+c2d0LCBETUFfVE9fREVWSUNFKTsKPiAgIAkJ
ZHJtX3ByaW1lX2dlbV9kZXN0cm95KCZkb2JqLT5vYmosIE5VTEwpOwo+ICAgCX0KPiAgIAo+IEBA
IC01MzksOCArNTM5LDggQEAgaW50IGFybWFkYV9nZW1fbWFwX2ltcG9ydChzdHJ1Y3QgYXJtYWRh
X2dlbV9vYmplY3QgKmRvYmopCj4gICB7Cj4gICAJaW50IHJldDsKPiAgIAo+IC0JZG9iai0+c2d0
ID0gZG1hX2J1Zl9tYXBfYXR0YWNobWVudChkb2JqLT5vYmouaW1wb3J0X2F0dGFjaCwKPiAtCQkJ
CQkgICBETUFfVE9fREVWSUNFKTsKPiArCWRvYmotPnNndCA9IGRtYV9idWZfbWFwX2F0dGFjaG1l
bnRfdW5sb2NrZWQoZG9iai0+b2JqLmltcG9ydF9hdHRhY2gsCj4gKwkJCQkJCSAgICBETUFfVE9f
REVWSUNFKTsKPiAgIAlpZiAoSVNfRVJSKGRvYmotPnNndCkpIHsKPiAgIAkJcmV0ID0gUFRSX0VS
Uihkb2JqLT5zZ3QpOwo+ICAgCQlkb2JqLT5zZ3QgPSBOVUxMOwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
